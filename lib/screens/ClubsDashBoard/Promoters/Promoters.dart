import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/BottomButton.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/eventcard.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/searchbar.dart';

class Promoters extends StatefulWidget {
  const Promoters({super.key});

  @override
  State<Promoters> createState() => _PromotersState();
}

class _PromotersState extends State<Promoters> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String searchValue;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFF2C2F33),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: HeaderContent(title: "Promoters"),
            ),
            SizedBox(
              height: height / 50,
            ),
            Container(
                height: height /15,
                width: width / 1.15,
                child: SearchBar()),
            SizedBox(
              height: height / 50,
            ),
            eventcard(height, width, "Manish Choudary", "Code: A X 0 9 J",20),
            SizedBox(
              height: height / 42,
            ),
            eventcard(height, width, "Manish Choudary", "Code: A X 0 9 J",20),
            SizedBox(
              height: height / 42,
            ),
            eventcard(height, width, "Manish Choudary", "Code: A X 0 9 J",20),
            SizedBox(
              height: height / 42,
            ),
            eventcard(height, width, "Manish Choudary", "Code: A X 0 9 J",20),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: width / 5, right: width / 5, bottom: width / 20),
        child: bottombutton(
          "Add promoter",
          const Icon(
            Icons.add,
            size: 35,
          ),
        ),
      ),
    ));
  }
}

