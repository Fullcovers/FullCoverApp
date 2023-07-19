import "dart:io";

import "package:flutter/material.dart";
import "package:venq_assessment/Models/Clubs.dart";
import "package:venq_assessment/Models/UserModel.dart";
import "package:venq_assessment/Styles/Colors.dart";

class Constants {
  static String uri =
      "https://fullcover-node-app.herokuapp.com/api/v1/";
      // "https://test-fullcover-node-api-9430bb87dcaf.herokuapp.com/api/v1/";
  static late String usertoken;
  static late UserData btsprofile;
  static late ClubModel? myclub;
  static late List<ClubModel> allclubs;
  static String backgroundimage = "assets/images/background2.png";
 static Widget mycircularProgressIndicator() {
    return Center(
        child: Container(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(color: golden)));
  }
}
