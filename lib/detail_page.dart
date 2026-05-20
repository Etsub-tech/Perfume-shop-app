import 'package:flutter/material.dart';
import 'perfume_model.dart';

class DetailPage extends StatelessWidget {
  final Perfume perfume;
  final VoidCallback? onAddToCart;

  const DetailPage({
    super.key,
    required this.perfume,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    // screen height — so the container always fits the device
    final double screenHeight = MediaQuery.of(context).size.height;
    // MediaQuery.of(context).size gives you the actual screen size.
    // Using screenHeight instead of a fixed 840 means it works
    // on every phone size without overflowing.

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          // Background bottom container — uses screen height instead of 840
          Container(
            height: screenHeight,   // ← was hardcoded 840, now fits any screen
            width: double.infinity,
            decoration: BoxDecoration(
              color: perfume.secondColor,
              borderRadius: BorderRadius.circular(60),
            ),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.7), // 70% of screen down
                Text(
                  perfume.name.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    perfume.description,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  perfume.price,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),

          // Top colored card with image
          Positioned(
            top: -80,
            left: 0,
            right: 0,
            bottom: 200,
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: perfume.color,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  Text(
                    perfume.name.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      perfume.image,
                      height: 450,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),

      // ── Bottom button — Expanded removed ──────────────
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
        // ↑ reduced horizontal padding too — 150 was too tight on small screens

        // ✅ Expanded removed — it doesn't belong here.
        // TextButton fills the Padding naturally on its own.
        child: TextButton(
          onPressed: () {
            if (onAddToCart != null) {
              onAddToCart!();
            }
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Added to cart')),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_basket, color: perfume.color),
              const SizedBox(width: 8),
              Text(
                'Add to basket',
                style: TextStyle(color: perfume.color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}