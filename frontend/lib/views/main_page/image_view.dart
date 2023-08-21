import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/models/pollution.dart';
import 'package:frontend/views/base_style/base_page.dart';

import '../../url.dart';

class ImageView extends StatelessWidget {
  
  Pollution pollution;
  ImageView(this.pollution, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // write the pollution information later
        // Text(pollution.street),
        // Text(pollution.type),
        SizedBox(height: 30),
        Center(
            child: Image.network(
          '$HOST/${pollution.image}',
          height: 400,
        ), ),

        SizedBox(height: 40),

        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('العودة',style: Theme.of(context).textTheme.headlineSmall),
        ),
      ],
    );
  }
}
