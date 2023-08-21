import 'package:flutter/material.dart';
import 'package:frontend/models/pollution.dart';

class FilterDropButton extends StatefulWidget {

  Function filterPollutions;

  FilterDropButton(this.filterPollutions, {super.key});

  @override
  State<FilterDropButton> createState() => _FilterDropButtonState();
}

class _FilterDropButtonState extends State<FilterDropButton> {


  var _selectedType = 'الكل';
  final _pollutionTypes = [
    'الكل',
    'كتابة على الجدران',
    'لوحة إرشاد باهتة',
    'لوحة إرشاد تالفة',
    'حفريات',
    'نفايات',
    'أعمال طريق',
    'لوحة سيئة',
    'رمل على الطريق',
    'أرصفة مشوهة',
    'واجهة سيئة',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      height: 42,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          style: Theme.of(context).textTheme.bodySmall,
          dropdownColor: Colors.white,
          focusColor: Colors.transparent,
          value: _selectedType,
          items: _pollutionTypes
              .map((type) => DropdownMenuItem(value: type, child: Text(type)))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() => _selectedType = value);
              widget.filterPollutions(value);
            }
          },
        ),
      ),
    );
  }
}
