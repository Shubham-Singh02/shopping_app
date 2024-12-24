import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Cart',
          style: Theme.of(context).textTheme.titleLarge),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
          final cartItem=cart[index];
          return ListTile(
            leading: CircleAvatar(
             backgroundImage: AssetImage(cartItem['imageUrl']as String),
             radius: 35,
            ),
            title:Text( cartItem['title'] as String,
            style: const  TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
            subtitle: Text('Size:${cartItem['size']}',
            style:  const  TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),),
        
            trailing: IconButton(onPressed: (){
              showDialog(
                barrierDismissible: false,
                context: context, builder:(context){
                return  AlertDialog(
                  
                  title: const Text('Delete Product',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),

                  content: const Text('Are you sure you want to remove the item'),

                  actions: [
                    TextButton(onPressed: () {
                      Navigator.of(context).pop();
                    },
                     child:const  Text(
                      'No',
                    style: TextStyle(fontWeight: FontWeight.w600,
                    color: Colors.blue),
                    ) 
                    ),

                    TextButton(onPressed: () {
                      Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);
                      Navigator.of(context).pop();
                    },
                     child:const  Text(
                      'Yes',
                    style: TextStyle(fontWeight: FontWeight.w600,
                    color: Colors.red),
                    ) 
                    ),


                  ],
                );

              });
            }, icon: const Icon(Icons.delete,
            color: Colors.red,),) 
        
        
          );
        
          },
        
        ),
      )
    );
  }
}