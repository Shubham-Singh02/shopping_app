import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';
import 'package:shop_app_flutter/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 60, 89, 93)),
          primaryColor: const Color.fromARGB(255, 74, 110, 114),
          // rgba(60,89,93,255)
          // rgba(39, 210, 198, 0.25)
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )
          ),
          textTheme: const TextTheme(
            titleLarge:TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 35,
            ) 
          )
      
        ),
        home: const Homepage(),
      ),
    );
  }
}