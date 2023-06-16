import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:venq_assessment/Providers/UserProvider.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Auth/Login.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/BehindThe%20Scenes/BehindTheScenes.dart';
import 'package:venq_assessment/utils/Constants.dart';

class Loadingpage extends StatelessWidget {
  const Loadingpage({super.key});

  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserProvider>(context);

    Constants.usertoken = userprovider.token;
    return userprovider.token.isEmpty
            ? const LoginPage()
            // : Constants.btsprofile.role == "user"
            //     ? MyBookingPage()
                : BehindTheScenesPage(); }
}