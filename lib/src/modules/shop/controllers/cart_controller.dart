import 'package:get/get.dart';
import '../../../data/models/product.dart';

class CartItem {
  final Product product;
  final RxInt quantity;

  CartItem({required this.product, int quantity = 1}) : quantity = quantity.obs;
}

class CartController extends GetxController {
  final cartItems = <CartItem>[].obs;

  void addToCart(Product product) {
    final existingIndex = cartItems.indexWhere((item) => item.product.id == product.id);
    if (existingIndex != -1) {
      cartItems[existingIndex].quantity.value++;
    } else {
      cartItems.add(CartItem(product: product));
    }
    Get.snackbar('Added to Cart', '${product.title} added to your basket');
  }

  void removeFromCart(int productId) {
    cartItems.removeWhere((item) => item.product.id == productId);
  }

  void incrementQuantity(int productId) {
    final index = cartItems.indexWhere((item) => item.product.id == productId);
    if (index != -1) cartItems[index].quantity.value++;
  }

  void decrementQuantity(int productId) {
    final index = cartItems.indexWhere((item) => item.product.id == productId);
    if (index != -1 && cartItems[index].quantity.value > 1) {
      cartItems[index].quantity.value--;
    } else if (index != -1) {
      cartItems.removeAt(index);
    }
  }

  double get subtotal => cartItems.fold(0.0, (sum, item) {
    final priceStr = item.product.price?.replaceAll(RegExp(r'[^0-9.]'), '') ?? '0.0';
    return sum + (double.tryParse(priceStr) ?? 0.0) * item.quantity.value;
  });

  double get discount => subtotal * 0.1; // Example 10% discount
  double get deliveryCharge => 0.0; // Free delivery for demo

  double get total => subtotal - discount + deliveryCharge;
}
