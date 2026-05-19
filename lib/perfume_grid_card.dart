// lib/perfume_grid_card.dart

import 'package:flutter/material.dart';
import 'dart:ui';
import 'perfume_model.dart';
import 'detail_page.dart';

class PerfumeGridCard extends StatelessWidget {
  final Perfume perfume;

  const PerfumeGridCard({super.key, required this.perfume});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(perfume: perfume),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [

            // Layer 1: colored background
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    perfume.color.withOpacity(0.25),
                    perfume.color.withOpacity(0.5),
                  ],
                ),
              ),
            ),

            // Layer 2: glass blur
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.white.withOpacity(0.3)),
            ),

            // Layer 3: content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(perfume.image, style: const TextStyle(fontSize: 36)),
                  const SizedBox(height: 8),
                  Text(
                    perfume.name,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2A1A1A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    perfume.price,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1A0A0A),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}