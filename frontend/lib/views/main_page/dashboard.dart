import 'package:flutter/material.dart';
import 'actions.dart';
import 'package:frontend/views/main_page/pollution_list.dart';
class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(height: 60),

        

        AdminActions(),

        SizedBox(height: 20),

        Container(
          width: 1030,
          height: 300,
          child: PollutionList(),
        )

        
        
      ],
    );
  }
}
