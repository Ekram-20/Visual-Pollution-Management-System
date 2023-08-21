import 'package:flutter/material.dart';
import 'package:frontend/views/main_page/dashboard.dart';

import '../statistic_page/statistics.dart';
import 'base_page.dart';

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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BasePage(
                    title: 'الرئيسية',
                    bodyWidget: Dashboard(),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.grid_view_rounded),
            label: const Text('الرئيسية', textAlign: TextAlign.right),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 24),
              textStyle: Theme.of(context).textTheme.headlineSmall,
              alignment: const Alignment(0.8, 0),
            ),
          ),

          // TextButton.icon(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => BasePage(
          //           title: 'إحصائيات',
          //           bodyWidget: Statistics(),
          //         ),
          //       ),
          //     );
          //   },
          //   icon: const Icon(Icons.bar_chart),
          //   label: const Text('إحصائيات'),
          //   style: TextButton.styleFrom(
          //     padding: const EdgeInsets.symmetric(vertical: 24),
          //     textStyle: Theme.of(context).textTheme.headlineSmall,
          //     alignment: const Alignment(0.8, 0),
          //   ),
          // ),
        ],
      ),
    );
  }
}
