import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1D1C21), 
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/logo.png', width: 250,), // logo
          TextButton.icon(
            onPressed: () {},
            
            icon: const Icon(Icons.add), // Replace with your desired icon
            label: const Text('الرئيسية'), // Replace with your desired text
          ),

          const SizedBox(height: 24),
    
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add), // Replace with your desired icon
            label: const Text('إحصائيات'), // Replace with your desired text
          ),
        ],
      ),
    );
  }
}



