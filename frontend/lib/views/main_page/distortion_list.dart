import 'package:flutter/material.dart';
import 'package:frontend/models/dummy.dart';

class DistortionList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      // child: Row(
      //   children: const [
      //     Text('city'),
      //     Text('location'),
      //     Text('Type'),
      //     Text('Image'),
      //     Text('Action'),
      //   ],
      // ),

      child: DataTable(
        columns: const [
          DataColumn(label: Text('المنطقة')),
          DataColumn(label: Text('إحداثيات الموقع')),
          DataColumn(label: Text('النوع')),
          DataColumn(label: Text('صورة')),
          DataColumn(label: Text('قبول')),
          DataColumn(label: Text('رفض')),
        ],
        rows: violations.map((violation) {
          return DataRow(cells: [
            DataCell(Text(violation.name)),
            DataCell(Text(violation.location)),
            DataCell(Text(violation.type)),
            // DataCell(Image.network(violation.image)),
            DataCell(Text('image')),
            DataCell(IconButton(onPressed: () {}, icon: Icon(Icons.add))),
            DataCell(IconButton(onPressed: () {}, icon: Icon(Icons.add)))
          ]);
        }).toList(),
      ),
    );





    // return ListView.builder(
    //   // itemCount: violations.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Card(

    //       margin: const EdgeInsets.all(10.0),
    //       child: Text('coard'),

    // child: Column(
    //   children: [
    //     // Image.network(violations[index].image),
    //     ListTile(
    //       title: Text('city'), //Text(violations[index].name),
    //       subtitle: Text('location'), //Text(violations[index].location),
    //       trailing: Row(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           ElevatedButton(
    //             onPressed: () {
    //               // Approve button logic
    //             },
    //             child: Text('Approve'),
    //           ),
    //           SizedBox(width: 10.0),
    //           ElevatedButton(
    //             onPressed: () {
    //               // Reject button logic
    //             },
    //             child: Text('Reject'),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // ),
    //       );
    //     },
    //   );
  }
}
