import 'package:electromate/View/Shop/shopPage.dart';
import 'package:flutter/material.dart';

import 'product.dart';

class Cart extends ChangeNotifier {
  //list for idea for sale
  List<Product> products = [
    Product(
      name: 'Smart clock',
      description: 'description here',
      imagePath: 'lib/images/smart-clock.png',
      price: '0Da',
    ),
    Product(
      name: 'Smart clock',
      description: 'description here',
      imagePath: 'lib/images/smart-clock.png',
      price: '0Da',
    ),
    Product(
      name: 'Smart clock',
      description: 'description here',
      imagePath: 'lib/images/smart-clock.png',
      price: '0Da',
    ),
    Product(
      name: 'Smart clock',
      description: 'description here',
      imagePath: 'lib/images/smart-clock.png',
      price: '0Da',
    ),
  ];

  //list of items in user cart
  List<Product> userCart = [];
  //get list of shose for sale
  List<Product> getProductList() {
    return products;
  }

  //get cart
  List<Product> getUserCart() {
    return userCart;
  }

  //add item to cart
  void addItemToCart(Product product) {
    userCart.add(product);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Product product) {
    userCart.remove(product);
    notifyListeners();
  }
}
