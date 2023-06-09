import 'package:flutter/material.dart';
import 'package:venq_assessment/Styles/Colors.dart';

Widget topnavigationbar(double height, double width) {
  double overlapFraction = 0.5;

  return Stack(
    children: [
      Column(children: [
        Container(
          height: height / 12,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Center(
                    child: Image.asset(
                  "assets/images/group.png",
                  scale: 1,
                )),
                height: height / 10,
                width: width / 7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: backgroundColorfigma,
                ),
              ),
              SizedBox(
                width: width / 3,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Center(
                    child: Image.asset(
                      "assets/images/person.png",
                    ),
                  ),
                ),
                height: height / 15,
                width: width / 7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: backgroundColorfigma,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment(0, -overlapFraction),
          child: FractionalTranslation(
            translation: Offset(0, -overlapFraction),
            child: Container(
              height: height / 11,
              width: 3 * width / 6,
              decoration: BoxDecoration(
                color: backgroundColorfigma,
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 11,
                    ),
                    Container(
                      width: width / 6.5,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(60),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Container(
                      width: width / 6.5,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(60),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.location_on_outlined),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    ],
  );
}
