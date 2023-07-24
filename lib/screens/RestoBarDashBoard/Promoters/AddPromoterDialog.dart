import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:venq_assessment/Styles/Colors.dart';
import 'dart:convert';

import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/utils/Utils.dart';

class AddPromoterDialog extends StatefulWidget {
  @override
  _AddPromoterDialogState createState() => _AddPromoterDialogState();
}

class _AddPromoterDialogState extends State<AddPromoterDialog> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _userList = [];
  bool loded = false;
  Future<void> _searchUsers(String keyword) async {
    final String apiUrl =
        '${Constants.uri}user/search?keyword=$keyword&role=club';

    try {
      print("apiUrl");
      print(apiUrl);
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data['data'].length);
        setState(() {
          _userList = [];
          for (var i = 0; i < data['data'].length; i++) {
            _userList.add(data['data'][i]);
          }
          print("_userList");
          print(_userList);
        });
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> createeventfunction({
    required BuildContext context,
    required String userId,
    required String discount,
  }) async {
    var body = {"userId": userId, "discount": discount};
    try {
      Dio dio = new Dio();
      var res = await dio.post('${Constants.uri}promoter/',
          data: body,
          options: Options(
              headers: {'Authorization': 'Bearer ${Constants.usertoken}'}));

      if (res.statusCode == 200) {
        showSnackBar(context, "Added");
      }
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
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
                  title: Text(
                    _userList[index]['name']['firstName'].toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    // Handle the selected user
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                     
                        final TextEditingController percentageController =
                            TextEditingController();
                        return AlertDialog(
                          scrollable: true,
                          title: const Text(
                            "Add Promoter",
                          ),
                          content: Column(
                            children: [
                              Text(_userList[index]['name']['firstName']
                                  .toString()),
                              TextFormField(
                                controller: percentageController,
                                decoration: const InputDecoration(
                                  labelText: "Percentage",
                                  icon: Icon(Icons.percent),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  // If the button is pressed, return green, otherwise blue
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.black;
                                  }
                                  return Colors.black;
                                }),
                              ),
                              child: Text(
                                "Add",
                                style: GoogleFonts.sairaCondensed(
                                    fontSize: 15, color: golden),
                              ),
                              onPressed: () {
                                createeventfunction(context: context,userId:_userList[index]['_id'],discount: percentageController.text );
                              },
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  // If the button is pressed, return green, otherwise blue
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.black;
                                  }
                                  return Colors.black;
                                }),
                              ),
                              child: Text(
                                "Cancel",
                                style: GoogleFonts.sairaCondensed(
                                    fontSize: 15, color: golden),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
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
