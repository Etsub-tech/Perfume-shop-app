// lib/perfume_card.dart

import 'package:flutter/material.dart';
import 'perfume_model.dart';
import 'detail_page.dart';

class PerfumeCard extends StatelessWidget {
  final Perfume perfume;
  final bool isSelected; 
  final Color perfumeColor;

  const PerfumeCard({
    super.key,
    required this.perfume,
    required this.perfumeColor,
    this.isSelected = false,
  });

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

      child: Container(
        width: 300,
        margin: const EdgeInsets.only(right: 20),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          
        ),

        child: Container(
          decoration: BoxDecoration(
            color: perfumeColor,
            borderRadius: BorderRadius.circular(20)),

          child: Container(
            height: 700,
            child:
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      perfume.brand,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Center(
                      child: Image.asset(perfume.image, height: 200),
                    ),

                    const SizedBox(height: 25),

                    // Product subtitle
                    Text(
                      perfume.subtitle,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Price — bold
                    Text(
                      perfume.price,
                      style: const TextStyle(
                        fontSize: 25,
                        
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
          
          
            
          ),
        ),
      ),
    );
  }
}