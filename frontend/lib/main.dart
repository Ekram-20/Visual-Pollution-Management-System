
import 'package:flutter/material.dart';
import 'package:frontend/views/base_page.dart';

void main() => runApp(TheApp());



class TheApp extends StatelessWidget {
  const TheApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
    
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const Directionality( 
        textDirection: TextDirection.rtl, 
        child: BasePage(),
      ),

    );
  }
}

