import 'package:flutter/material.dart';
import 'distortion_list.dart';
import 'actions.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // Row(),

        AdminActions(),
        
        DistortionList(),
      ],
    );
  }
}
