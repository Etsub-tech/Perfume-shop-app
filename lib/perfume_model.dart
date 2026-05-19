import 'package:flutter/material.dart';

class Perfume {
  final String name;
  final String brand;
  final String subtitle;
  final String price;
  final String image;
  final String description;
  final Color color;

  const Perfume({
    required this.name,
    required this.brand,
    required this.subtitle,
    required this.price,
    required this.image,
    required this.description,
    required this.color,
  });
}

const List<Perfume> perfumeList = [
  Perfume(
    name: 'Aqua Universalis',
    brand: 'MAISON FRANCIS',
    subtitle: 'AQUA UNIVERSALIS 100ML',
    price: '£70.00',
    image: 'assets/images/perfume1.webp',
    description:
        'Blur gender boundaries and be unconventionally free with this flowery-vanilla eau de parfum. In the heart of the fragrance.',
    color: Color.fromARGB(255, 86, 39, 58),
  ),
  Perfume(
    name: 'Shalimar Inital',
    brand: 'GUERLAIN',
    subtitle: 'SHALIMAR SHE 100ML',
    price: '£60.00',
    image: 'assets/images/perfume2.webp',
    description:
        'A warm, sensual oriental fragrance inspired by the legendary gardens of the Taj Mahal. Timeless and magnetic.',
    color: Color(0xFFD4B896),
  ),
  Perfume(
    name: 'Miss Dior',
    brand: 'CHRISTIAN DIOR',
    subtitle: 'MISS DIOR 100ML',
    price: '£95.00',
    image: 'assets/images/perfume3.webp',
    description:
        'A radiant floral fragrance — elegant, joyful, and irresistibly feminine. A bouquet of Grasse roses.',
    color: Color(0xFFE8B4C8),
  ),
  Perfume(
    name: "L'Interdit",
    brand: 'GIVENCHY',
    subtitle: "L'INTERDIT 80ML",
    price: '£78.00',
    image: 'assets/images/perfume4.webp',
    description:
        'Audacious and modern. A white floral with a dark soul, created for the woman who dares to defy convention.',
    color: Color(0xFF8B9BB4),
  ),
  Perfume(
    name: 'Black Orchid',
    brand: 'TOM FORD',
    subtitle: 'BLACK ORCHID 100ML',
    price: '£145.00',
    image: 'assets/images/perfume5.webp',
    description:
        'Opulent and dark. Black Orchid weaves rare black truffle and oud with a floriental heart of extraordinary depth.',
    color: Color(0xFF6B4E71),
  ),
];