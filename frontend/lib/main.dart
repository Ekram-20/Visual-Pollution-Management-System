import 'dart:convert'; // for json
import 'package:flutter/material.dart';
import 'package:frontend/models/pollution.dart';
import 'package:frontend/views/base_style/base_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'url.dart';
import 'views/main_page/dashboard.dart';

void main() => runApp(const TheApp());

class TheApp extends StatelessWidget {
  
  const TheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Visual Pollution',
      theme: ThemeData(
        primaryColor: const Color(0xff545259),
        primarySwatch: Colors.grey,
        textTheme: TextTheme(
          titleLarge: GoogleFonts.tajawal(
            color: Colors.black,
            fontSize: 36,
            fontWeight: FontWeight.w900,
          ),
          headlineSmall: GoogleFonts.tajawal(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: GoogleFonts.tajawal(
            color: Colors.black,
            fontSize: 20,
          ),
          headlineMedium: GoogleFonts.tajawal(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          bodySmall: GoogleFonts.tajawal(
            fontSize: 14,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BasePage(title: 'الرئيسية', bodyWidget: Dashboard()),
      },
  
    );
  }
}
