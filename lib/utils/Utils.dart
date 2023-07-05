import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:venq_assessment/Styles/Colors.dart';

void showSnackBar(BuildContext context, String text) {
  showDialog(
          context: context,
          builder: (context) {
            Future.delayed(Duration(seconds: 2), () {
              Navigator.of(context).pop(true);
            });
            return AlertDialog(backgroundColor: Colors.white,shape: RoundedRectangleBorder(
		borderRadius: BorderRadius.circular(30),
	),
              title: Center(child: Text(text, style: GoogleFonts.bebasNeue(
                                    color: golden, fontSize: 25),)),
            );
          });
}

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 403:
      showSnackBar(context, "Forbidden Not Authenticated!!");
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(context, response.body);
  }
}
