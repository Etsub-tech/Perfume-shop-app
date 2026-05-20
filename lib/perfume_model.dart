import 'package:flutter/material.dart';

class Perfume {
  final String name;
  final String brand;
  final String category;
  final String subtitle;
  final String price;
  final String image;
  final String description;
  final Color color;
  final Color secondColor;

  const Perfume({
    required this.name,
    required this.brand,
    required this.category,
    required this.subtitle,
    required this.price,
    required this.image,
    required this.description,
    required this.color,
    required this.secondColor,
  });
}

const List<String> categoryList = [
  'All',
  'Woody',
  'Fresh',
  'Floral',
  'Oriental',
];

const List<Perfume> perfumeList = [
  Perfume(
    name: 'Eclaire',
    brand: 'Lattafa',
    category: 'Woody',
    subtitle: 'Eau de Parfum 100ML',
    price: '10,500 ETB',
    image: 'assets/images/perfume2.webp',
    description:
        'A creamy-sweet blend of caramel, honey, and vanilla with a soft musky finish.',
    color: Color.fromRGBO(134, 84, 84, 0.8),
    secondColor: Color.fromARGB(184, 174, 132, 154),
  ),
  Perfume(
    name: 'Oud Silk',
    brand: 'Dior',
    category: 'Woody',
    subtitle: 'Eau de Parfum 100ML',
    price: '28,900 ETB',
    image: 'assets/images/perfume5.webp',
    description:
        'A rich woody scent with cedar, oud, and spicy amber, perfect for evening wear.',
    color: Color.fromRGBO(110, 72, 62, 0.9),
    secondColor: Color.fromARGB(255, 175, 140, 119),
  ),
  Perfume(
    name: 'Bombshell',
    brand: "Victoria's Secret",
    category: 'Fresh',
    subtitle: 'Eau de Parfum 100ML',
    price: '30,800 ETB',
    image: 'assets/images/perfume3.webp',
    description:
        'A bright, fruity-floral fragrance with passionfruit, peony, and vanilla orchid.',
    color: Color(0xFFE8B4C8),
    secondColor: Color.fromARGB(255, 170, 133, 147),
  ),
  Perfume(
    name: 'Acqua di Gio',
    brand: 'Armani',
    category: 'Fresh',
    subtitle: 'Eau de Toilette 100ML',
    price: '25,900 ETB',
    image: 'assets/images/perfume8.webp',
    description:
        'A crisp aquatic scent with bergamot, neroli, and marine notes for everyday freshness.',
    color: Color.fromRGBO(183, 215, 226, 0.9),
    secondColor: Color.fromARGB(255, 145, 188, 204),
  ),
  Perfume(
    name: 'Flowerbomb Nectar',
    brand: 'Viktor & Rolf',
    category: 'Floral',
    subtitle: 'Eau de Parfum 100ML',
    price: '20,200 ETB',
    image: 'assets/images/v&r.png',
    description:
        'An intense floral gourmand with orange blossom, cassis, and warm tonka.',
    color: Color.fromARGB(255, 137, 65, 93),
    secondColor: Color.fromARGB(255, 103, 77, 85), 
  ),
  Perfume(
    name: 'Delina',
    brand: 'Parfums de Marly',
    category: 'Floral',
    subtitle: 'Eau de Parfum 100ML',
    price: '14,000 ETB',
    image: 'assets/images/perfume4.webp',
    description:
        'A delicate rose-garden scent with lychee, rhubarb, and Turkish rose.',
    color: Color.fromARGB(255, 246, 177, 211),
    secondColor: Color.fromARGB(255, 206, 163, 192),
  ),
  Perfume(
    name: "Donna Born in Roma",
    brand: 'Valentino',
    category: 'Oriental',
    subtitle: "L'INTERDIT 80ML",
    price: '30,500 ETB',
    image: 'assets/images/perfume1.webp',
    description:
        'A warm oriental floral with jasmine, vanilla, and woodsy patchouli.',
    color: Color.fromRGBO(4, 3, 3, 0.8),
    secondColor: Color.fromARGB(255, 88, 83, 84),
  ),
  Perfume(
    name: 'Shalimar Initial',
    brand: 'Guerlain',
    category: 'Oriental',
    subtitle: 'Eau de Parfum 90ML',
    price: '32,000 ETB',
    image: 'assets/images/perfume1.webp',
    description:
        'A luxurious oriental blend with black vanilla, iris, and precious woods.',
    color: Color.fromRGBO(90, 58, 53, 0.86),
    secondColor: Color.fromARGB(255, 165, 130, 118),
  ),
];