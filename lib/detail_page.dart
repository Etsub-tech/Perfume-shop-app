import 'dart:ui';
import 'package:flutter/material.dart';
import 'perfume_model.dart'; // import your model

class DetailPage extends StatelessWidget {
  final Perfume perfume;

  const DetailPage({
    super.key,
    required this.perfume,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 840,
            width: double.infinity,
            decoration: BoxDecoration(
              color: perfume.color,
              borderRadius: BorderRadius.circular(60),
            ),
            child: Column(
            children: [
              SizedBox(height: 680),
              Text(perfume.name.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              
              SizedBox(height: 20),

              Text(perfume.description,
                style: TextStyle(
                  color: Colors.white,
                )),

                SizedBox(height: 20),

              Text(perfume.price, style: TextStyle( fontSize: 20))
            ],)
       ),

           Positioned(
            top: -80,
            left: 0,
            right: 0, 
            bottom: 200,
            child: Container(
            margin: const EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 182, 148, 159).withOpacity(0.4),
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
                Container(
                  child: Center(
                    child: Image.asset(
                    perfume.image,
                    height:450,
                    fit : BoxFit.cover
                    )
                  
                ),)
              ],
            ),
            )),
        ],

       
      ),
      bottomNavigationBar: Container(child: Text('Add to basket'))
    );
  }
}
