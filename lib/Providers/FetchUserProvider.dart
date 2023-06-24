import 'package:flutter/foundation.dart';
import 'package:venq_assessment/Models/QrUserModel.dart';

import '../Models/UserModel.dart';

class FetchUser with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // Setter method to update the isLoading value
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  UserModel? user;
  QrUserModel? qruser;
  UserModel parseUserDetails(Map<String, dynamic> responseData) {
    return UserModel(
      id: responseData['id'],
      data: UserData(
        name: Name(
          firstName: responseData['data'][0]['name']['firstName'],
          lastName: responseData['data'][0]['name']['lastName'],
        ),
        id: responseData['data'][0]['_id'],
        email: responseData['data'][0]['email'],
        password: responseData['data'][0]['password'],
        phoneNumber: responseData['data'][0]['phoneNumber'],
        role: responseData['data'][0]['role'],
        image: responseData['data'][0]['image'],
        isVerified: responseData['data'][0]['isVerified'],
        v: responseData['data'][0]['__v'],
      ),
      message: responseData['message'],
    );
  }

  QrUserModel qrUserDetails(Map<String, dynamic> responseData) {
    return QrUserModel(
      id: responseData['id'],
      data: [
        QrUserData(
          name: QrName(
            firstName: responseData['data'][0]['name']['firstName'],
            lastName: responseData['data'][0]['name']['lastName'],
          ),
          id: responseData['data'][0]['_id'],
          email: responseData['data'][0]['email'],
          password: responseData['data'][0]['password'],
          role: responseData['data'][0]['role'],
          image: responseData['data'][0]['image'],
          coverCoins: responseData['data'][0]['cover_coins'],
          isVerified: responseData['data'][0]['isVerified'],
          v: responseData['data'][0]['__v'],
        ),
      ],
      message: responseData['message'],
    );
  }

  void setFetchedUser(UserModel u) {
    user = u;
  }

  void setQrFetchedUser(QrUserModel u) {
    qruser = u;
  }
}
