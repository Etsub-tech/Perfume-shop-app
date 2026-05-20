// lib/perfume_grid_card.dart

import 'package:flutter/material.dart';

class PerfumeGridCard extends StatelessWidget {
  final Color selectedColor;
  final String category;

  const PerfumeGridCard({super.key, required this.selectedColor, required this.category});

  List<Map<String, String>> get _brandLogos {
    return {
      'Woody': [
        {'label': 'Lattafa', 'image': 'assets/images/logo1.png'},
        {'label': 'Valentino', 'image': 'assets/images/logo7.webp'},
      ],
      'Fresh': [
        {'label': "Victoria's Secret", 'image': 'assets/images/logo2.png'},
        {'label': 'YSL', 'image': 'assets/images/ysl.png'},
      ],
      'Floral': [
        {'label': 'Dior', 'image': 'assets/images/Dior-Logo-PNG-Clipart.png'},
        {'label': 'Viktor & Rolf', 'image': 'assets/images/v&r.png'},
      ],
      'Oriental': [
        {'label': 'Gucci', 'image': 'assets/images/gucci.webp'},
        {'label': 'Versace', 'image': 'assets/images/logo6.png'},
      ],
      'Gourmand': [
        {'label': 'Parfums de Marly', 'image': 'assets/images/logo4.avif'},
        {'label': 'Chanel', 'image': 'assets/images/logo3.jpg'},
      ],
    }[category] ??
        [
          {'label': 'Dior', 'image': 'assets/images/Dior-Logo-PNG-Clipart.png'},
          {'label': 'Gucci', 'image': 'assets/images/gucci.webp'},
        ];
  }

  Widget _brandCard(String label, String imagePath) {
    return Expanded(
      child: Card(
        color: Color.lerp(selectedColor, Colors.white, 0.7)!,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: SizedBox(
          height: 150,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imagePath, width: 70, height: 70, fit: BoxFit.contain),
                const SizedBox(height: 10),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 116, 61, 61),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final brands = _brandLogos;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        const Text('Brand Available', style: TextStyle(fontSize: 20)),
        const SizedBox(height: 20),
        Row(
          children: [
            _brandCard(brands[0]['label']!, brands[0]['image']!),
            const SizedBox(width: 16),
            _brandCard(brands[1]['label']!, brands[1]['image']!),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
