import 'package:flutter/material.dart';

class Chair {
  final String imageUrl;
  final String name;
  final String type;
  final String color;
  final String description;
  final double rating;
  final int price;
  final int height;
  final int weight;
  final Color backgorundColor;

  Chair({
    required this.imageUrl,
    required this.name,
    required this.type,
    required this.color,
    required this.description,
    required this.rating,
    required this.price,
    required this.height,
    required this.weight,
    required this.backgorundColor
  });
}