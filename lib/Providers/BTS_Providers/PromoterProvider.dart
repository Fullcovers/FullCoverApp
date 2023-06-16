import 'package:flutter/material.dart';

import '../../Models/BTS_Models/Promoters.dart';

class PromoterProvider with ChangeNotifier {
  List<PromoterModel> _promoters = [];

  List<PromoterModel> get promoters => _promoters;

  // void setPromoters(List<PromoterModel> promoters) {
  //   _promoters = promoters;
  //   notifyListeners();
  //
  void clearPromoters() {
    _promoters = []; // Make the list empty
    notifyListeners();
  }

  void storePromoterDetails(dynamic response) {
    final List<dynamic> data = response['data'];

    for (var promoterData in data) {
      final dynamic userData = promoterData['user'];
      final dynamic nameData = userData['name'];

      final UserModel user = UserModel(
        id: userData['_id'],
        name: NameModel(
          firstName: nameData['firstName'],
          lastName: nameData['lastName'],
        ),
        email: userData['email'],
        password: userData['password'],
        phoneNumber: userData['phoneNumber'],
        role: userData['role'],
        image: userData['image'],
        isVerified: userData['isVerified'],
      );

      final PromoterModel promoter = PromoterModel(
        id: promoterData['_id'],
        club: promoterData['club'],
        user: user,
        promoCode: promoterData['promo_code'],
        discount: promoterData['discount'],
        createdAt: DateTime.parse(promoterData['createdAt']),
        updatedAt: DateTime.parse(promoterData['updatedAt']),
      );

      promoters.add(promoter);
    }

    notifyListeners();
  }

  List<PromoterModel> getPromoters() {
    return _promoters;
  }
}
