import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/models/pollution.dart';
import 'package:http/http.dart' as http;
import '/url.dart';

class PollutionList extends StatefulWidget {
  const PollutionList({super.key});

  @override
  State<PollutionList> createState() => _PollutionListState();
}

class _PollutionListState extends State<PollutionList> {
  List<Pollution> _pollutions = [];

  @override
  void initState() {
    super.initState();
    _getAll();
  }

  Future<void> _getAll() async {
    try {
      final response = await http.get(getPollutionsURL);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Pollution> pollutionsTemp =
            data.map((item) => Pollution.fromJson(item)).toList();

        setState(() {
          _pollutions = pollutionsTemp;
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    
    var columnNames = [
      'التاريخ',
      'المنطقة',
      'إحداثيات الموقع',
      'النوع',
      'صورة',
      'رفض'
    ];

    return Card(
      child: DataTable(
        columns: columnNames
            .map(
              (column) => DataColumn(
                label: Text(column,
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
            )
            .toList(),
        rows: _pollutions.map((pollution) {
          return DataRow(
            cells: [
              DataCell(Text(pollution.date,
                  style: Theme.of(context).textTheme.headlineMedium)),
              DataCell(Text(pollution.street,
                  style: Theme.of(context).textTheme.headlineMedium)),
              DataCell(Text(pollution.location,
                  style: Theme.of(context).textTheme.headlineMedium)),
              DataCell(Text(pollution.type,
                  style: Theme.of(context).textTheme.headlineMedium)),
              // DataCell(Image.network('$HOST/${pollution.image}', fit: BoxFit.fitWidth)),
              DataCell(Text('انقر لمشاهدة الصورة',
                  style: Theme.of(context).textTheme.headlineMedium)),
              DataCell(
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.cancel_outlined, color: Colors.red),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
