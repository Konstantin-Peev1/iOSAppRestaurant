import SwiftUI

// Global constants for UserDefaults keys
let kFirstName = "firstNameKey"
let kLastName = "lastNameKey"
let kEmail = "emailKey"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @Environment(\.managedObjectContext) private var viewContext

    // State variables for user input
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""

    // State variable to trigger navigation to Home
    @State private var isLoggedIn = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.appYellow.edgesIgnoringSafeArea(.all) // Yellow background

                VStack(spacing: 20) {
                    Text("Welcome to Little Lemon!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.appBlue)

                    Spacer().frame(height: 20)  // Extra space between title and form fields

                    // First Name TextField
                    TextField("First Name", text: $firstName)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal)

                    // Last Name TextField
                    TextField("Last Name", text: $lastName)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal)

                    // Email TextField
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal)

                    // Register Button
                    Button(action: {
                        // Registration action
                        if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                            // Store the values in UserDefaults
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            print("Registration successful")
                            isLoggedIn = true
                        } else {
                            print("Please fill in all fields")
                        }
                    }) {
                        Text("Register")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.appBlue)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)

                    Spacer()

                    // NavigationLink to Home, triggered when isLoggedIn becomes true
                    NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                        EmptyView()
                    }
                }
                .padding()
            }
            .navigationTitle("Registration")
        }
    }
}

