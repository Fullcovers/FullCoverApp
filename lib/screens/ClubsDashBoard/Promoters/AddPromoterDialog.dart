import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:venq_assessment/utils/Constants.dart';

class AddPromoterDialog extends StatefulWidget {
  @override
  _AddPromoterDialogState createState() => _AddPromoterDialogState();
}

class _AddPromoterDialogState extends State<AddPromoterDialog> {
  TextEditingController _searchController = TextEditingController();
  List<String> _userList = [];
bool loded=false;
  Future<void> _searchUsers(String keyword) async {
    final String apiUrl =
        '${Constants.uri}user/search?keyword=$keyword&role=club';

    try {
      print("apiUrl");
      print(apiUrl);
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);print(data['data'].length);
        setState(() {
          _userList = [];
          for (var i = 0; i < data['data'].length; i++) {
            _userList.add(data['data'][i]['name']['firstName']);
            
          }
          print("_userList");print(_userList);

        });
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                _searchUsers(value);
              },
              decoration: const InputDecoration(
                hintText: 'Search users',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 200, // Adjust the height based on your needs
            child: ListView.builder(
              itemCount: _userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_userList[index],style: TextStyle(color: Colors.black),),
                  onTap: () {
                    // Handle the selected user
                    showDialog(                            context: context
,builder: (BuildContext context) { return AlertDialog(); },);
                    // Navigator.of(context).pop(_userList[index]);
                  },  
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
