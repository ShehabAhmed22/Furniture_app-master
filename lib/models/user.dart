

import 'package:furnitureui/models/cart.dart';

class User {
  final String name;
  final List<Cart> cart;

  User({
    required this.name,
    required this.cart,
  });
}