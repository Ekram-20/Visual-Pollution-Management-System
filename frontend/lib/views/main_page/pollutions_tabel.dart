import 'package:flutter/material.dart';
import 'package:frontend/models/pollution.dart';
import 'package:frontend/views/main_page/image_view.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../base_style/base_page.dart';
import '/url.dart';

class PollutionsTable extends StatefulWidget {

  List<Pollution> pollutions = [];
  void Function(int) delete;

  PollutionsTable(this.pollutions, this.delete, {super.key});

  @override
  State<PollutionsTable> createState() => _PollutionsTableState();
}

class _PollutionsTableState extends State<PollutionsTable> {
 
  final columnNames = [
    'التاريخ',
    'المنطقة',
    'إحداثيات الموقع',
    'النوع',
    'صورة',
    'رفض'
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: widget.pollutions.isEmpty
          ? Container(
            height: 410,
            child: Center(
                child: Text("لا يوجد بيانات",
                    style: Theme.of(context).textTheme.headlineSmall)),
          )
          : DataTable(
              columns: columnNames
                  .map(
                    (column) => DataColumn(
                      label: Text(column,
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),
                  )
                  .toList(),
              rows: widget.pollutions.map((pollution) {
                return DataRow(
                  cells: [
                    DataCell(Text(pollution.date,
                        style: Theme.of(context).textTheme.bodySmall)),
                    DataCell(Text(pollution.street,
                        style: Theme.of(context).textTheme.bodySmall)),
                    DataCell(Text(pollution.location,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall)),
                    DataCell(Text(pollution.type,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall)),
                    DataCell(
                      TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BasePage(
                                      title: "عرض التشوه",
                                      bodyWidget: ImageView(pollution)))),
                          child: Text('انقر لمشاهدة الصورة',
                              style: Theme.of(context).textTheme.bodySmall)),
                    ),
                    DataCell(
                      IconButton(
                        onPressed: () {
                          widget.delete(pollution.id); 
                        },
                        icon: const Icon(Icons.cancel_outlined,
                            color: Colors.red),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
    );
  }
}
