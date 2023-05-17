import 'package:flutter/material.dart';

import 'FooterButtons.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Flexible(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              width: 0,
              color: Colors.white,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: const Alignment(0, 0.5),
              child: FractionalTranslation(
                translation: const Offset(0, 0.5),
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFBFBFB),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 10,
                          spreadRadius: -2,
                          offset: Offset(-2, -2),
                        ),
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5,
                          spreadRadius: -2,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.qr_code_scanner,
                          size: 45,
                        )),
                  ),
                ),
              ),
            ),
            FooterButtons(
              width: width,
              colorb: const Color(0xFF2C2F33),
              textcolor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
