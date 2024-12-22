import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variables.dart';

class ProductDetails extends StatefulWidget {
  final Map<String,Object>product;
  const ProductDetails({super.key,required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedsize=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 110),
          child:  Text('Details',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),)),
      ),
      
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 40,
              child: Center(
                child: Text((widget.product['title'])as String,
                style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            
          ),
          const Spacer(),
          Image.asset((widget.product['imageUrl'])as String ),
          const Spacer(
            flex: 1,
          ),
          Container(
            height: 280,
            width: double.infinity,
            decoration: const  BoxDecoration(
              color: Color.fromRGBO(209, 217, 222, 1),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35))
              

            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),

                Text('\$${widget.product['price']}',
                style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(
                  height: 20,
                ),
                 SizedBox(
                  height: 60,
                  child: ListView.builder(
                    
                    scrollDirection: Axis.horizontal,
                    
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context,index){
                      final size= (widget.product['sizes']as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedsize=size;
                            });
                            
                          },
                          child: Chip(
                            backgroundColor: selectedsize==size?Theme.of(context).colorScheme.primary:null,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            ),
                            label: Text(size.toString(),
                            style: TextStyle(
                              color: selectedsize==size?Colors.white:null,
                            ),),
                          ),
                        ),
                        
                      );

                  }),


                ),

                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: ElevatedButton.icon(
                    icon: const Icon(Icons.shopping_cart,
                    color: Color.fromARGB(255, 201, 201, 201),),
                    
                    
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(double.infinity, 50),
                      
                    ),
                    
                    onPressed: (){}, label: const Text(
                      'Add To Cart',
                    style:  TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                      
                    ),
                 )

                
              ],
            ),
            
          ),



        ],
      ),
    );
  }
}

