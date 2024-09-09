import SwiftUI
import CoreData

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
        @EnvironmentObject var cartManager: CartManager

        @State private var searchText = ""
        @State private var sortField = "name"
        @State private var isAscending = true
        @State private var showAddedToCartMessage = false
        @State private var showFilter = false // State to show/hide the filter modal

        var body: some View {
            NavigationView {
                ZStack {
                    Color.appYellow.opacity(0.1).edgesIgnoringSafeArea(.all)  // Light yellow background

                    VStack {
                        // Search bar to filter dishes by name
                        HStack {
                            TextField("Search menu", text: $searchText)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)

                            // Filter button to open the filter modal
                            Button(action: {
                                showFilter = true
                            }) {
                                Image(systemName: "line.horizontal.3.decrease.circle")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.appBlue)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal)

                        // Fetch and display the dishes
                        FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                            if dishes.isEmpty {
                                Text("No dishes available.")
                                    .foregroundColor(.gray)
                                    .padding()
                            } else {
                                List {
                                    ForEach(dishes, id: \.self) { dish in
                                        Button(action: {
                                            cartManager.addToCart(dish: dish)
                                            showAddedToCartMessage = true
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                showAddedToCartMessage = false
                                            }
                                        }) {
                                            HStack {
                                                VStack(alignment: .leading) {
                                                    Text(dish.name ?? "Unknown Dish")
                                                        .font(.headline)
                                                        .foregroundColor(Color.appBlue)

                                                    Text("$\(dish.price, specifier: "%.2f")")
                                                        .foregroundColor(Color.appGrayText)
                                                        .font(.subheadline)
                                                }
                                                .padding(.vertical, 5)

                                                Spacer()

                                                Image(systemName: "plus.circle.fill")
                                                    .foregroundColor(Color.appYellow)
                                                    .font(.title2)
                                            }
                                            .padding()
                                            .background(Color.white)
                                            .cornerRadius(10)
                                            .shadow(radius: 3)
                                        }
                                        .buttonStyle(PlainButtonStyle()) // Removes default button styling
                                    }
                                }
                                .listStyle(PlainListStyle())
                            }
                        }
                    }

                    // Pop-up for "Added to Cart"
                    if showAddedToCartMessage {
                        VStack {
                            Spacer()
                            Text("Added to Cart")
                                .font(.headline)
                                .padding()
                                .background(Color.appBlue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .transition(.move(edge: .bottom))
                                .animation(.easeInOut)
                                .padding(.bottom, 30)
                        }
                    }
                }
                .sheet(isPresented: $showFilter) { // Use .sheet to show the filter modal
                               FilterView(sortField: $sortField, isAscending: $isAscending, showFilter: $showFilter)
                                   .background(Color.appBlue.edgesIgnoringSafeArea(.all))
                           }
                .navigationTitle("Menu")
                .onAppear {
                    getMenuData()
                    print("Dishes fetched from Core Data")
                }
            }
        }


    // Function to build sort descriptors for sorting by name or price
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [
            NSSortDescriptor(key: sortField, ascending: isAscending, selector: sortField == "name" ? #selector(NSString.localizedStandardCompare(_:)) : nil)
        ]
    }
    

    // Function to build a predicate for filtering dishes by name
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)  // No filtering
        } else {
            return NSPredicate(format: "name CONTAINS[cd] %@", searchText)
        }
    }

    func getMenuData() {
        // Check if any dishes already exist in Core Data
        let fetchRequest: NSFetchRequest<Dish> = Dish.fetchRequest()

        do {
            let dishCount = try viewContext.count(for: fetchRequest)
            if dishCount > 0 {
                print("Dishes already exist. Skipping fetch.")
                return  // Exit the function if dishes already exist
            }
        } catch {
            print("Error checking for existing dishes: \(error)")
        }

        // Clear the old data first (if necessary, but this could also be skipped)
        clearOldDishes()

        // Convert the jsonString to Data
        let jsonData = Data(jsonString.utf8)

        // Parse the JSON data
        let decoder = JSONDecoder()
        do {
            let menuList = try decoder.decode(MenuList.self, from: jsonData)
            DispatchQueue.main.async {
                saveMenuToCoreData(menuItems: menuList.menu)
            }
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }

    // Save menu items to Core Data
    func saveMenuToCoreData(menuItems: [MenuItem]) {
        for menuItem in menuItems {
            let dish = Dish(context: viewContext)
            dish.name = menuItem.title  // Assuming your JSON has "name" instead of "title"
            dish.price = menuItem.price
            dish.image = menuItem.image
            dish.descriptionText = menuItem.descriptionText ?? ""

            print("Saving dish: \(dish.name ?? "")")
            
            // Save each dish
            do {
                try viewContext.save()
            } catch {
                print("Failed to save dish: \(error)")
            }
        }
    }

    // Function to clear old data
    func clearOldDishes() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Dish.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try viewContext.execute(deleteRequest)
        } catch {
            print("Failed to delete existing dishes: \(error)")
        }
    }
}
