import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchField extends StatelessWidget {

  TextEditingController searchController = TextEditingController();
  void Function(String)? searchFor;

  SearchField(this.searchController, this.searchFor, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: 430,
      child: TextField(
        onChanged: searchFor,
        controller: searchController,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, size: 20),
          labelStyle: Theme.of(context).textTheme.bodySmall,
          labelText: 'اكتب اسم المنطقة',
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
