import 'package:flutter/material.dart';
import 'package:venq_assessment/Styles/Colors.dart';

Widget topnavigationbar(double height, double width, bool iscolor) {
  double overlapFraction = 0.5;

  return Stack(
    children: [
      Column(
        children: [
        // Container(
        //   height: height / 12,
        //   width: double.maxFinite,
        //   decoration: const BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.only(
        //       bottomLeft: Radius.circular(50),
        //       bottomRight: Radius.circular(50),
        //     ),
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       Container(
        //         child: Center(
        //             child: Image.asset(
        //           "assets/images/group.png",
        //           scale: 1,
        //         )),
        //         height: height / 10,
        //         width: width / 7,
        //         decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           color: backgroundColorfigma,
        //         ),
        //       ),
        //       SizedBox(
        //         width: width / 3,
        //       ),
        //       Container(
        //         child: Padding(
        //           padding: const EdgeInsets.only(left: 5.0),
        //           child: Center(
        //             child: Image.asset(
        //               "assets/images/person.png",
        //             ),
        //           ),
        //         ),
        //         height: height / 15,
        //         width: width / 7,
        //         decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           color: backgroundColorfigma,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.only(top: height / 22),
          child: Align(
            alignment: Alignment(0, -overlapFraction),
            child: FractionalTranslation(
              translation: Offset(0, -overlapFraction),
              child: Container(
                height: height / 10,
                width:width,
                decoration: BoxDecoration(
                  color: iscolor ? backgroundColorfigma : Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      Container(
                        width: width / 6.5,
                        decoration: BoxDecoration(
                          boxShadow: iscolor?[
                            BoxShadow(
                              color: Color.fromARGB(255, 88, 88, 88),
                              offset: Offset(-4, -4),
                              blurRadius: 10,
                              spreadRadius: -2,
                            ),
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(4, 4),
                              blurRadius: 15,
                              spreadRadius:
                                  -2, // how far the color effect spreads.
                            ),
                          ]:[
                            BoxShadow(
                              color: Color.fromARGB(255, 88, 88, 88),
                              offset: Offset(4, 4),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4, -4),
                              blurRadius: 15,
                              spreadRadius:
                                  -2, // how far the color effect spreads.
                            ),
                          ],
                          color: iscolor ? backgroundColorfigma : Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: FractionalTranslation(
                          translation: height<700?Offset(0, -overlapFraction):Offset(0, 0),
                          child: IconButton(
                            icon: Icon(
                              Icons.search,
                              size: height<700?width/25:width/15,
                            ),
                            color:
                                iscolor ? Colors.white : backgroundColorfigma,
                            onPressed: () {},
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Container(
                        width: width / 7,
                        decoration: BoxDecoration(
                          boxShadow: iscolor?[
                            BoxShadow(
                              color: Color.fromARGB(255, 88, 88, 88),
                              offset: Offset(-4, -4),
                              blurRadius: 10,
                              spreadRadius: -2,
                            ),
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(4, 4),
                              blurRadius: 15,
                              spreadRadius:
                                  -2, // how far the color effect spreads.
                            ),
                          ]:[
                            BoxShadow(
                              color: Color.fromARGB(255, 88, 88, 88),
                              offset: Offset(4, 4),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4, -4),
                              blurRadius: 15,
                              spreadRadius:
                                  -2, // how far the color effect spreads.
                            ),
                          ],
                          color: iscolor ? backgroundColorfigma : Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: FractionalTranslation(
                          translation: height<700?Offset(0, -overlapFraction):Offset(0, 0),
                          child: IconButton(
                            icon: Icon(
                              Icons.location_on_outlined,
                              size: height<700?width/25:width/15,
                            ),
                            color:
                                iscolor ? Colors.white : backgroundColorfigma,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    ],
  );
}
