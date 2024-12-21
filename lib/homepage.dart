import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variables.dart';
import 'package:shop_app_flutter/product_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String>filters=const ['All','Adidas','Nike','Puma'];
  late String selectedfilter;
  @override
  void initState() {
    
    super.initState();
    selectedfilter=filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border= OutlineInputBorder(
                       borderSide: BorderSide(
                        color: Color.fromRGBO(225, 225, 225, 1),
                       ),
                       borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
            
                      );
    
    return   Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                 Padding(
                  padding:  EdgeInsets.all(18.0),
                  child: Text("     Shoes\nCollection",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                  ),
                ),
                 Expanded(
                  child: TextField(
                    
                    decoration: InputDecoration(
                      
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border:border,
                      enabledBorder: border,
                      
                    ),
                    
                  
                  
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context,index){
                    final filter=filters[index];
                  return Padding(
                    padding: const  EdgeInsets.symmetric(horizontal: 10),
                    
                    child: GestureDetector(
                      onTap: () {
                       setState(() {
                          selectedfilter = filter; // Update the selected filter
                        });
                      },
                      child: Chip(
                        
                        backgroundColor:selectedfilter==filter?Theme.of(context).colorScheme.primary: Color.fromRGBO(245, 247, 249, 1),
    
                        elevation: 3,
                       shadowColor:const Color.fromRGBO(85, 85, 85, 1) ,
                       shape: RoundedRectangleBorder(
                        
                        borderRadius: BorderRadius.circular(50),
                       ),
                        
                        
                        
                        label: Padding(
                          padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Text(filter,
                          style: TextStyle(
                           color:selectedfilter == filter
                                  ? Colors.white
                                  : const Color.fromARGB(255, 61, 61, 61),
                            fontWeight: FontWeight.w500,
                          ),)
                          ),
                          labelStyle: const TextStyle(
                            fontSize: 14,
                          ),
                        
                        ),
                    ),
                  );
              
              
                }
                ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              
              child: ListView.builder(
                itemCount:products.length ,
                itemBuilder: (context,index){
                  final product=products[index];
                  return ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    image: product['imageUrl'] as String,
                    backgroundColor: index.isEven?const Color.fromARGB(255, 197, 229, 227):const Color.fromRGBO(245, 247, 249, 1),
                   
              
                    
                  );
                  
              
                }),
            )
            
          ],
        ),
      ),
      
    );
  }
}