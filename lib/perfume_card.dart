// lib/perfume_card.dart

import 'package:flutter/material.dart';
import 'dart:ui'; // ← REQUIRED for ImageFilter (the blur effect)
import 'perfume_model.dart';
import 'detail_page.dart';

class PerfumeCard extends StatelessWidget {
  final Perfume perfume;
  final bool isSelected; // ← NEW: is this the active card?

  const PerfumeCard({
    super.key,
    required this.perfume,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // When tapped, push DetailPage onto the navigation stack.
      // Navigator.push slides a new screen in from the right.
      // MaterialPageRoute wraps the destination widget.
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(perfume: perfume),
          ),
        );
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
        width: 160,
        margin: const EdgeInsets.only(right: 14),

        // Selected card scales up slightly — gives a "focus" feel
        // We use a Transform here so the size stays the same
        // but it visually pops forward
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: perfume.color.withOpacity(isSelected ? 0.5 : 0.2),
              blurRadius: isSelected ? 24 : 12,
              offset: const Offset(0, 8),
            ),
          ],
        ),

        child: ClipRRect(
          // ClipRRect clips its child to a rounded rectangle.
          // REQUIRED here because BackdropFilter (the blur) needs
          // to be clipped — otherwise it bleeds outside the card.
          borderRadius: BorderRadius.circular(22),

          child: Stack(
            children: [

              // ── LAYER 1: Colored background ────────────
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      perfume.color.withOpacity(0.35),
                      perfume.color.withOpacity(0.65),
                    ],
                  ),
                ),
              ),

              // ── LAYER 2: Glass blur effect ─────────────
              // BackdropFilter applies an image filter to everything
              // BEHIND it in the widget tree. Combined with a
              // semi-transparent white overlay, this creates the
              // frosted glass / glassmorphism look.
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 12, // horizontal blur strength
                  sigmaY: 12, // vertical blur strength
                  // Higher sigma = more blurry. 8-16 is the sweet spot
                  // for glassmorphism. Too high looks foggy.
                ),
                child: Container(
                  // Semi-transparent white overlay on top of the blur.
                  // This is what gives the "frosted" glass appearance.
                  // Without this, the blur alone looks grey/muddy.
                  color: Colors.white.withOpacity(0.25),
                ),
              ),

              // ── LAYER 3: Actual card content ───────────
              // This sits on top of the blurred background
              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Brand name at top
                    Text(
                      perfume.brand,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF3A2020),
                        letterSpacing: 0.5,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Emoji image — centered
                    Center(
                      child: Text(
                        perfume.image,
                        style: const TextStyle(fontSize: 72),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Product subtitle
                    Text(
                      perfume.subtitle,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF5A4040),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Price — bold
                    Text(
                      perfume.price,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2A1010),
                      ),
                    ),
                  ],
                ),
              ),

              // ── LAYER 4: Selected ring ─────────────────
              // Shows a colored border around the card when
              // it's the currently selected one
              if (isSelected)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: perfume.color,
                        width: 2.5,
                      ),
                    ),
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}