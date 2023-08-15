import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: const Color(0xFF1D1C21),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/logo.png', width: 250), // logo

          SizedBox(height: 24),

          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.grid_view_rounded),
            label: const Text('الرئيسية', textAlign: TextAlign.right),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 24),
              textStyle: Theme.of(context).textTheme.headlineSmall,
            ),
          ),

          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.bar_chart),
            label: const Text('إحصائيات'),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 24),
              alignment: AlignmentDirectional(0, 4),
              textStyle: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }
}
