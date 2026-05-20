// lib/perfume_grid_card.dart

import 'package:flutter/material.dart';

class PerfumeGridCard extends StatelessWidget {
  final Color selectedColor;

  const PerfumeGridCard({super.key, required this.selectedColor});
  
  Widget myOptions(String text1, String imagePath1, String text2, String imagePath2){
        return Row(children: [
            Column(
              children: [
              Card(
              color: Color.lerp(selectedColor, Colors.white, 0.7)!,
              child: SizedBox(
              width: 160,
              height: 150,
              child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        Image.asset(imagePath1, width:40, height: 40),
                        Text(text1, style: TextStyle(color: Color.fromARGB(255, 116, 61, 61), fontSize: 16))])) ,),),
            ],
            ),
            const SizedBox(width: 20), 
            Column(children: [
              Card(
                color: Color.lerp(selectedColor, Colors.white, 0.7)!,
                child: SizedBox(
                width:160,
                height:150,
                child:Center(child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children:[
                    Image.asset(imagePath2, width:40, height: 40),
                    Text(text2,  style: TextStyle(color: Color.fromARGB(255, 116, 61, 61), fontSize: 16))]))
              ))
            ],
            )
          ,],);
     
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Text('Brand Available', style: TextStyle(fontSize: 20),),
       const SizedBox(height: 20),
       myOptions("Christian Dior", "assets/images/logo1.png", "Chanel", "assets/images/logo2.png"),
        const SizedBox(height: 20),
        myOptions("Yves Saint Laurent", "assets/images/logo3.jpg" , "Gucci", "assets/images/logo4.avif"),
        const SizedBox(height: 20),
        myOptions("Versace", "assets/images/logo6.png", "Valentino", "assets/images/logo7.webp"),
        const SizedBox(height: 20),
    ],);

     }
}