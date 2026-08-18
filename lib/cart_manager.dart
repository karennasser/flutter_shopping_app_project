class CartManager {
  static final List<Map<String, String>> cartItems = [];

  static void addToCart(Map<String, String> product) {
    cartItems.add(product);
  }

  static void removeFromCart(int index) {
    cartItems.removeAt(index);
  }

  static void clearCart() {
    cartItems.clear();
  }
}