import 'package:flutter/material.dart';

class ExportButton extends StatelessWidget {
  const ExportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.ios_share_outlined, size: 20),
      label: const Text('تصدير'),
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(120, 42),
        textStyle: Theme.of(context).textTheme.bodySmall,
      ),
      
    );
  }
}
