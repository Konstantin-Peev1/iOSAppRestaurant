import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        NavigationView {
            VStack {
                if cartManager.cart.isEmpty {
                    Text("Your cart is empty")
                        .padding()
                        .foregroundColor(Color.appGrayText)
                } else {
                    List {
                        ForEach(cartManager.cart) { cartItem in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(cartItem.dish.name ?? "Unknown Dish")
                                        .font(.headline)
                                        .foregroundColor(Color.appBlue)

                                    Text("Qty: \(cartItem.quantity)")
                                        .foregroundColor(Color.appGrayText)
                                        .font(.subheadline)
                                }
                                Spacer()
                                Text("$\(cartItem.dish.price * Float(cartItem.quantity), specifier: "%.2f")")
                                    .foregroundColor(.gray)
                                
                                Button(action: {
                                    cartManager.removeFromCart(cartItem: cartItem)
                                }) {
                                    Image(systemName: "minus.circle.fill")
                                        .foregroundColor(Color.appYellow)
                                        .font(.title2)
                                }
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                        }
                    }
                    .listStyle(PlainListStyle())

                    // Total Price
                    Text("Total: $\(cartManager.calculateTotalPrice(), specifier: "%.2f")")
                        .font(.title)
                        .foregroundColor(Color.appBlue)
                        .padding()
                        .background(Color.appYellow)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        .padding(.top)
                }
            }
            .navigationTitle("Cart")
        }
    }
}
