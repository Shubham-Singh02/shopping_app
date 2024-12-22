import 'package:flutter/material.dart';
import 'package:shop_app_flutter/cart_page.dart';
import 'package:shop_app_flutter/product_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
 
  int currentpage=0;
  List<Widget> pages=[ProductList(),CartPage()];
  @override
  Widget build(BuildContext context) {
    
    return   Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentpage,
        onTap: (value) {
          setState(() {
            currentpage=value;
          });
        },
        iconSize: 35.0,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: const [
           BottomNavigationBarItem(
            icon: Icon(Icons.home,
            ),
            label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,
             
           ),
           label: '',
           )

        ],
      ),
      body:IndexedStack(
        index: currentpage,
        children:pages,
      ), 
      
    );
  }
}