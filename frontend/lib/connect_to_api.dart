



// // return all pollutions list stored in db
// // Null when error happens
// Future<List<Pollution>> getPollutions() async {

//   try {
//     final response = await http.get(getPollutionsURL);

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       return data.map((item) => Pollution.fromJson(item)).toList();
      
//     }
//     else {
//       print('Request failed with status: ${response.statusCode}');
//     }

//   } catch (error) {
//     print('Error fetching data: $error');
//   }

//   return [];
// }










// Future<void> _getAll() async {

//   try {
//     final response = await http.get(getPollutionsURL);

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       final List<Pollution> pollutionsTemp =
//           data.map((item) => Pollution.fromJson(item)).toList();

//       // setState(() {
//       //   _pollutions = pollutionsTemp;
//       // });

//       return pollutionsTemp;


//     } else {
//       print('Request failed with status: ${response.statusCode}');
//     }
//   } catch (error) {
//     print('Error fetching data: $error');
//   }

//   return null;
// }

