import "dart:io";

import "package:venq_assessment/Models/Clubs.dart";
import "package:venq_assessment/Models/UserModel.dart";

class Constants {
  static String uri = 
  // "https://fullcover-node-app.herokuapp.com/api/v1/";
  "https://test-fullcover-node-api-9430bb87dcaf.herokuapp.com/api/v1/";
  static late String usertoken;
  static late UserData btsprofile;
  static late ClubModel? myclub;
  static  String backgroundimage="assets/images/background.png";
}
