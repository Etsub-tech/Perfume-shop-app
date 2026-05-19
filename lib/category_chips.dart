import 'package:flutter/material.dart';
import 'perfume_model.dart'; 
class CategoryChips extends StatelessWidget {

  final int selectedIndex;
  final Color selectedColor;

  final Function(int) onChipTapped;
  
  const CategoryChips({
    super.key,
    required this.selectedIndex,
    required this.selectedColor,
    required this.onChipTapped,
  });

  @override
  Widget build(BuildContext context) {

   return SizedBox(
      height: 38,

      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 0),

       itemCount: perfumeList.length,

        itemBuilder: (context, index) {

          final Perfume perfume = perfumeList[index];
          final bool isSelected = index == selectedIndex;

          return GestureDetector(

         onTap: () => onChipTapped(index),

          child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,

             margin: const EdgeInsets.only(right: 10),

             padding: const EdgeInsets.symmetric(horizontal: 18),

              decoration: BoxDecoration(
                color: isSelected
                    ? selectedColor
                    : Colors.transparent,

                borderRadius: BorderRadius.circular(20),

                border: Border.all(
                  color: isSelected
                      ? selectedColor
                      : Colors.grey.shade300,
                  width: 1.5,
                ),
              ),

              child: Center(
                child: Text(
              perfume.brand.toUpperCase(),

                  style: TextStyle(
                    fontSize: 11,

                    fontWeight: isSelected
                        ? FontWeight.w700
                        : FontWeight.w500,

                    color: isSelected
                        ? Colors.white
                        : Colors.grey.shade600,

                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}