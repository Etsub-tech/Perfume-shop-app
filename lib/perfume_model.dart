import 'package:flutter/material.dart';

class Perfume {
  final String name;
  final String brand;
  final double price;
  final Color color;

  Perfume({
    required this.name,
    required this.brand,
    required this.price,
    required this.color,
  });
}

List<Perfume> perfumes = [
  Perfume(
    name: "Eau de Parfum",
    brand: "Brand A",
    price: 59.99,
    color: Colors.pink,
  ),
  Perfume(
    name: "Floral Essence",
    brand: "Brand B",
    price: 49.99,
    color: Colors.black,
  ),
  Perfume(
    name: "Citrus Breeze",
    brand: "Brand C",
    price: 39.99,
    color: Colors.green,
  ),
];