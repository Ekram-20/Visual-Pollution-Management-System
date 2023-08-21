import 'package:flutter/material.dart';
import 'package:frontend/views/main_page/export_button.dart';
import 'package:frontend/views/main_page/filter_dropbutton.dart';
import 'package:frontend/views/main_page/search_field.dart';
import 'package:frontend/views/main_page/pollutions_tabel.dart';
import 'package:frontend/models/pollution.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '/url.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  // This contains all pollutions
  List<Pollution> _pollutions = [];

  // This for filtering, search
  List<Pollution> _pollutionsToDisplay = [];

  // for search
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getPollutions();
  }

  Future<void> _getPollutions() async {
    try {
      final response = await http.get(getPollutionsURL);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Pollution> pollutionsTemp =
            data.map((item) => Pollution.fromJson(item)).toList(); 

        setState(() {
          _pollutions = pollutionsTemp.reversed.toList();
          _pollutionsToDisplay = List.of(_pollutions);
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  Future<void> _deletePollution(id) async {
    try {

      final url = Uri.parse('$HOST/main/delete/$id');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Pollution> pollutionsTemp =
            data.map((item) => Pollution.fromJson(item)).toList();

        setState(() {
          _pollutions = pollutionsTemp.reversed.toList();
          _pollutionsToDisplay = List.of(_pollutions);
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  // search
  void searchFor(String value) {
    var searchKey = value.trim(); //_searchController.text.trim();
  
    setState(() {
      if (searchKey.isEmpty) {
        _pollutionsToDisplay = _pollutions;
      }
      else {
        _pollutionsToDisplay = _pollutions
          .where((pollution) => pollution.street.toLowerCase().startsWith(searchKey))
          .toList();
      }
    });
  }

  // filter
  void filterPollutions(String type) {
    setState(() {
      _pollutionsToDisplay = type == 'الكل'
          ? _pollutions
          : _pollutions.where((pollution) => pollution.type == type).toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const SizedBox(height: 60),

        // Actions bar
        Row(
          children: [
            SearchField(_searchController, searchFor),
            const SizedBox(width: 16),
            // const Spacer(),
            FilterDropButton(filterPollutions),
            // const Spacer(),
            // ExportButton(),
          ],
        ),

        const SizedBox(height: 20),

        Container(
          margin: EdgeInsets.zero,
          width: double.infinity,
          height: 410,
          child: SingleChildScrollView(child: PollutionsTable(_pollutionsToDisplay, _deletePollution)),
        )
      ],
    );
  }
}
