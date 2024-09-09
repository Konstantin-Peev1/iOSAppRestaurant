import Foundation

class CartManager: ObservableObject {
    @Published var cart: [CartItem] = []

    func addToCart(dish: Dish) {
        if let index = cart.firstIndex(where: { $0.dish.name == dish.name }) {
            cart[index].quantity += 1
        } else {
            cart.append(CartItem(dish: dish, quantity: 1))
        }
    }

    func removeFromCart(cartItem: CartItem) {
        if let index = cart.firstIndex(where: { $0.id == cartItem.id }) {
            if cart[index].quantity > 1 {
                cart[index].quantity -= 1
            } else {
                cart.remove(at: index)
            }
        }
    }

    func calculateTotalPrice() -> Float {
        return cart.reduce(0) { $0 + ($1.dish.price * Float($1.quantity)) }
    }
}
