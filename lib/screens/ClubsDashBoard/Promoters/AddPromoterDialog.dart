import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddPromoterDialog extends StatefulWidget {
  @override
  _AddPromoterDialogState createState() => _AddPromoterDialogState();
}

class _AddPromoterDialogState extends State<AddPromoterDialog> {
  TextEditingController _searchController = TextEditingController();
  List<String> _userList = [];

  Future<void> _searchUsers(String keyword) async {
    final String apiUrl =
        'YOUR_API_URL/user/search?keyword=$keyword&limit=10&role=club';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          _userList = List<String>.from(data['users']);
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
                  title: Text(_userList[index]),
                  onTap: () {
                    // Handle the selected user
                    Navigator.of(context).pop(_userList[index]);
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
