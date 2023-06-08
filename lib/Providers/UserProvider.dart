import 'package:shared_preferences/shared_preferences.dart';

import '../Models/User.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      id: '', name: {}, email: '', password: '', phoneNumber: '', role: 'user');

  User get user => _user;
  String get token => _token;
  String _token = '';
  String _id = '';
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }

  Future<void> loadToken() async {
    final preferences = await SharedPreferences.getInstance();
    _token = preferences.getString('token') ?? '';
    notifyListeners();
  }

  Future<void> setToken(String token) async {
    _token = token;
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('token', token);
    notifyListeners();
  }

  Future<void> deleteToken() async {
    _token = token;
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('token', '');
    notifyListeners();
  }

  Future<void> setId(String id) async {
    _id = id;
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('userid', _id);
    notifyListeners();
  }

  Future<void> loadId() async {
    final preferences = await SharedPreferences.getInstance();
    _id = preferences.getString('userid') ?? '';
    notifyListeners();
  }

  String getId() {
    return _id;
  }
}
