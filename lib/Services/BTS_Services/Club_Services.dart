import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:image_picker/image_picker.dart';
import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/utils/Utils.dart';

class BTSClubServices {
  static Future<List<CarouselImageModel>> getCarouselImages(
      {required BuildContext context}) async {
    List<CarouselImageModel> listofcarouselImage = [];

    try {
      http.Response myclubres = await http.get(
        Uri.parse('${Constants.uri}club/my-club'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}',
        },
      );
      var myclub = jsonDecode(myclubres.body)['data'];
      print((myclub[0]['carousel_images']).length);

      for (var i = 0; i < (myclub[0]['carousel_images']).length; i++) {
        CarouselImageModel carouselImage = CarouselImageModel(
            name: myclub[0]['carousel_images'][i]['name'].toString(),
            imageUrl: myclub[0]['carousel_images'][i]['imageUrl'].toString(),
            id: myclub[0]['carousel_images'][i]['_id'].toString());
        listofcarouselImage.add(carouselImage);
      }
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
    return listofcarouselImage;
  }

  static Future<void> delCarouselImages({
    required BuildContext context,
    required String name,
  }) async {
    var body = {
      "name": name,
    };
    try {
      http.Response myclub = await http.get(
        Uri.parse('${Constants.uri}club/my-club'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}',
        },
      );
      var myclubid = jsonDecode(myclub.body)['data'][0]['_id'];
      print(myclubid);

      http.Response res = await http.put(
        Uri.parse(
          '${Constants.uri}club/$myclubid/carousel-image',
        ),
        headers: <String, String>{
          'Authorization': 'Bearer ${Constants.usertoken}'
        },
        body: body,
      );

      print(json.encode(body));
      print(res.body);
      showSnackBar(context, "Deleted");
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
  }

  static Future<void> addCarouselImages({
    required BuildContext context,
    required XFile imageFile,
  }) async {
    var body = {"image": imageFile, "name": imageFile.name};
    try {
      http.Response myclub = await http.get(
        Uri.parse('${Constants.uri}club/my-club'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}',
        },
      );
      var myclubid = jsonDecode(myclub.body)['data'][0]['_id'];
      print(myclubid);
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Constants.uri}club/$myclubid/carousel-image'));
      var fileStream = http.ByteStream(imageFile.openRead());
      var multipartFile =
          await http.MultipartFile.fromPath('image', imageFile.path);
      request.files.add(multipartFile);
      // request.files.add(http.MultipartFile("name",""));
      request.headers['Content-Type'] = 'application/json; charset=UTF-8';
      request.headers['Authorization'] = 'Bearer ${Constants.usertoken}';
      request.fields['name'] = "userId";

      var response = await request.send();
      var responseBody = await request.files[0].field;

      // http.Response res = await http.put(
      //   Uri.parse(
      //     '${Constants.uri}club/$myclubid/carousel-image',
      //   ),
      //   headers: <String, String>{
      //     'Authorization': 'Bearer ${Constants.usertoken}'
      //   },
      //   body: body,
      // );

      // print(json.encode(body));
      print(responseBody);
      print(imageFile.path);
      print(imageFile.name);
      print(imageFile.mimeType);
      showSnackBar(context, "Created");
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
  }
}
