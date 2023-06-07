import 'package:flutter/material.dart';

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
                child: IconButton(
                  icon: Icon(
                    Icons.supervisor_account_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                height: height / 15,
                width: width / 7,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF2C2F33),
                ),
              ),
              SizedBox(
                width: width / 3,
              ),
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                height: height / 15,
                width: width / 7,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF2C2F33),
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
              height: height / 10,
              width: 3 * width / 6,
              decoration: const BoxDecoration(
                color: Color(0xFF2C2F33),
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
                      height: height / 12,
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
                      height: height / 12,
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
