import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sidebar.dart';
import '../main_page/dashboard.dart';

// it must be the Scaffold
class BasePage extends StatelessWidget {
  final String title;
  final Widget bodyWidget;

  BasePage({super.key, required this.title, required this.bodyWidget});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F3F3),
        body: Row(
          children: [
            const SideBar(),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(88.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        'assets/images/evc-logo.png',
                        width: 180,
                        height: 48,
                        alignment: Alignment.topLeft,
                      ),
                    ),
                    Text(
                      title,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    bodyWidget,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
