import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;
  const ProductCard({super.key,
  required this.title,
  required this.price,
  required this.image,
  required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 5,
        shadowColor: const Color.fromRGBO(85, 85, 85, 1),
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(30),
      
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              
              ),),
              const SizedBox(
                height: 5,
              ),
          
              Text('\$$price',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              
              )
              
              ),
              const SizedBox(
                height: 5,
              ),
          
              Center(child: Image.asset(image,height: 190,)),
              
              
                
            ],
            
                
            
          ),
        ),
      
        
      ),
    );
  }
}