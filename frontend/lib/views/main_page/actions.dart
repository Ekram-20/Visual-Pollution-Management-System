import 'package:flutter/material.dart';
import 'package:frontend/models/pollution.dart';
import 'package:http/http.dart' as http;

// The admin can search, filter, and Export distortions

class ActionsBar extends StatefulWidget {
  const ActionsBar({super.key});

  @override
  State<ActionsBar> createState() => _ActionsBarState();
}

class _ActionsBarState extends State<ActionsBar> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose(); // free space
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Text Input
        // SizedBox(
        //   height: 42,
        //   width: 430,
        //   child: TextField(
        //     decoration: InputDecoration(
        //       prefixIcon: const Icon(Icons.search, size: 20),
        //       labelStyle: Theme.of(context).textTheme.bodySmall,
        //       labelText: 'اكتب اسم المنطقة أو  إحداثياتها',
        //       border: const OutlineInputBorder(),
        //       enabledBorder: const OutlineInputBorder(
        //         borderSide: BorderSide(color: Color(0xFFCECACA)),
        //       ),
        //       focusedBorder: const OutlineInputBorder(
        //         borderSide: BorderSide(width: 1, color: Color(0xFFCECACA)),
        //       ),
        //     ),
        //   ),
        // ),

        const SizedBox(width: 16),

        // // Filter Drop Button
        // OutlinedButton.icon(
        //   onPressed: () {},
        //   label: const Text('ترتيب'),
        //   style: OutlinedButton.styleFrom(
        //     fixedSize: const Size(120, 42),
        //     textStyle: Theme.of(context).textTheme.bodySmall,
        //   ),
        //   icon: const Icon(Icons.sort, size: 20),
        // ),

        const Spacer(),


        // Export Button
        // OutlinedButton.icon(
        //   onPressed: () {},
        //   icon: const Icon(Icons.ios_share_outlined, size: 20),
        //   label: const Text('تصدير'),
        //   style: OutlinedButton.styleFrom(
        //     fixedSize: const Size(120, 42),
        //     textStyle: Theme.of(context).textTheme.bodySmall,
        //   ),
        // ),
      ],
    );
  }
}
