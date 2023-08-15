import 'dart:convert'; // for json
import 'package:flutter/material.dart';
import 'package:frontend/models/pollution.dart';
import 'package:frontend/views/base_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'url.dart';

void main() => runApp(TheApp());

class TheApp extends StatelessWidget {
  const TheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          bodySmall: GoogleFonts.tajawal(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          headlineMedium: GoogleFonts.tajawal(
            fontSize: 14,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(body: BasePage()),
            ),
      },
      // home: Try(),
      // home: const Directionality(
      //   textDirection: TextDirection.rtl,
      //   child: BasePage(),
      // ),
    );
  }
}

class Try extends StatefulWidget {
  @override
  _TryState createState() => _TryState();
}

class _TryState extends State<Try> {
  List<Pollution> _pollutions = [];

  String test = 'Dont work';

  @override
  void initState() {
    super.initState();
    _getAll();
  }

  Future<void> _getAll() async {
    try {
      final response = await http.get(getPollutionsURL);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Pollution> pollutionsTemp =
            data.map((item) => Pollution.fromJson(item)).toList();

        setState(() {
          _pollutions = pollutionsTemp;
              print(_pollutions);

        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: _pollutions.length,
      itemBuilder: (context, index) {
        final pollution = _pollutions[index];
        return ListTile(
          title: Text(pollution.street),
          subtitle: Text(pollution.type),
        );
      },
    );
  }
}
