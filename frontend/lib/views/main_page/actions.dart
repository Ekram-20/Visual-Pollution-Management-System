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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // OutlinedButton.icon(
        //   onPressed: () {},
        //   // width: 40, // Square width
        //   // height: 40, // Square height
        //   // decoration: BoxDecoration(
        //   //   color: Colors.grey[300],
        //   //   borderRadius: const BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)), //circular(8),
        //   // ),
        //   icon: Icon(Icons.search, size: 20),
        //   label: Text(''),
        //   style: OutlinedButton.styleFrom(fixedSize: const Size(60, 42)),
        // ),

        

        SizedBox(
          height: 42,
          width: 450, // Adjust the width as needed
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search, size: 20),
              labelStyle: Theme.of(context).textTheme.bodySmall,
              labelText: 'اكتب اسم المنطقة أو  إحداثياتها',
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFCECACA)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFCECACA)),
              ),
            ),
          ),
        ),
        
        const SizedBox(width: 16),
        OutlinedButton.icon(
          onPressed: () {},
          label: const Text('ترتيب'),
          style: OutlinedButton.styleFrom(
            fixedSize: const Size(120, 42),
            textStyle: Theme.of(context).textTheme.bodySmall,
          ),
          icon: const Icon(Icons.sort, size: 20),
        ),
        const Spacer(),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.picture_as_pdf_outlined, size: 20),
          label: const Text('تصدير'),
          style: OutlinedButton.styleFrom(
            fixedSize: const Size(120, 42),
            textStyle: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
    
    
    
    //  Row(
    //     children: [

    //       Container(
    //         width: 400,
    //         height: 70,
    //         child: TextField(
    //           controller: searchController,
    //           decoration: const InputDecoration(
    //             label: Text('Enter city'),
    //             prefixIcon: Icon(Icons.search),
    //             border: OutlineInputBorder(),
    //           ),
    //           textAlign: TextAlign.right,
    //         ),
    //       ),
    
    //       ElevatedButton.icon(
    //           onPressed: () {},
    //           icon: const Icon(Icons.filter),
    //           label: const Text('Filter')),
    
    //       const Spacer(),
    
    //       ElevatedButton.icon(
    //           onPressed: () {},
    //           icon: const Icon(Icons.send),
    //           label: const Text('Export')),
    //     ],
      
    // );
