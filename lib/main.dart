import 'package:e_commerce/views/home_pade.dart';
import 'package:e_commerce/views/update_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:
      {
        HomePage.id:(context)=> HomePage(),
        UpdatePage.id:(context)=> UpdatePage(),
      } ,
      initialRoute: HomePage.id,
    );
  }
}

