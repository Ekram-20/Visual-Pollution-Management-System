import 'package:flutter/material.dart';
import 'sidebar.dart';
import 'main_page/dashboard.dart';

// it must be the Scaffold
class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: Row(
        children: [
          SideBar(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(88.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("The Title"),
                  Dashboard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
