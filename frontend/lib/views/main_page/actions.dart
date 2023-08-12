import 'package:flutter/material.dart';

// The admin can search, filter, and Export distortions

class AdminActions extends StatefulWidget {
  const AdminActions({super.key});

  @override
  State<AdminActions> createState() => _AdminActionsState();
}

class _AdminActionsState extends State<AdminActions> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [

          Container(
            width: 400,
            height: 100,
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                label: Text('Enter city'),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textAlign: TextAlign.right,
            ),
          ),
    
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.filter),
              label: const Text('Filter')),
    
          const Spacer(),
    
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.send),
              label: const Text('Export')),
        ],
      
    );
  }
}
