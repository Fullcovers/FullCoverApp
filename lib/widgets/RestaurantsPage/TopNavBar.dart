import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Filter/Filter.dart';

class topnavigationbar extends StatefulWidget {
  double height;
  double width;
  bool iscolor;
  topnavigationbar(
      {super.key,
      required this.height,
      required this.width,
      required this.iscolor});

  @override
  State<topnavigationbar> createState() => _topnavigationbarState();
}

class _topnavigationbarState extends State<topnavigationbar> {
  double hightofcont = 88;
  bool isloccontexpn = false;
  double overlapFraction = 0.5;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(children: [
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
            padding: EdgeInsets.only(top: widget.height / 22),
            child: Align(
              alignment: Alignment(0, -overlapFraction),
              child: FractionalTranslation(
                translation: Offset(0, -overlapFraction),
                child: Container(
                  height: hightofcont,  
                  width: widget.width,
                  decoration: BoxDecoration(
                    color: widget.iscolor ? backgroundColorfigma : Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/images/coinlogo.png",width: widget.width/10,),
                            const SizedBox(
                              width: 11,
                            ),
                            Row(
                              children: [
                                Container(
                              width: widget.width / 6.5,
                              decoration: BoxDecoration(
                                boxShadow: widget.iscolor
                                    ? [
                                        const BoxShadow(
                                          color:
                                              Color.fromARGB(255, 88, 88, 88),
                                          offset: Offset(-4, -4),
                                          blurRadius: 10,
                                          spreadRadius: -2,
                                        ),
                                        const BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(4, 4),
                                          blurRadius: 15,
                                          spreadRadius:
                                              -2, // how far the color effect spreads.
                                        ),
                                      ]
                                    : [
                                        // const BoxShadow(
                                        //   color:
                                        //       Color.fromARGB(255, 88, 88, 88),
                                        //   offset: Offset(4, -4),
                                        //   blurRadius: 15,
                                        //   spreadRadius: 1,
                                        // ),
                                        // const BoxShadow(
                                        //   color: Colors.white,
                                        //   offset: Offset(-4, -4),
                                        //   blurRadius: 15,
                                        //   spreadRadius:
                                        //       -2, // how far the color effect spreads.
                                        // ),
 const BoxShadow(
                                              color:
                                                  Color.fromARGB(255, 88, 88, 88),
                                              offset: Offset(-4, 4),
                                              blurRadius: 15,
                                              spreadRadius: 1,
                                            ),                                      ],
                                color: widget.iscolor
                                    ? backgroundColorfigma
                                    : Colors.white,
                                borderRadius: const BorderRadius.only(topLeft:
                                  Radius.circular(10),bottomLeft: Radius.circular(10)
                                ),
                              ),
                              child: FractionalTranslation(
                                translation: widget.height < 700
                                    ? Offset(0, -overlapFraction)
                                    : Offset(0, 0),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.search,
                                    size: widget.height < 700
                                        ? widget.width / 25
                                        : widget.width / 15,
                                  ),
                                  color: widget.iscolor
                                      ? Colors.white
                                      : backgroundColorfigma,
                                  onPressed: () {Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const FilterPage()));},
                                ),
                              ),
                            ),
                                Container(
                                  width: widget.width / 7,
                                  decoration: BoxDecoration(
                                    boxShadow: widget.iscolor
                                        ? [
                                            // const BoxShadow(
                                            //   color:
                                            //       Color.fromARGB(255, 88, 88, 88),
                                            //   offset: Offset(-4, -4),
                                            //   blurRadius: 10,
                                            //   spreadRadius: -2,
                                            // ),
                                            const BoxShadow(
                                              color: Colors.black,
                                              offset: Offset(4, 4),
                                              blurRadius: 15,
                                              spreadRadius:
                                                  -2, // how far the color effect spreads.
                                            ),
                                          ]
                                        : [
                                            const BoxShadow(
                                              color:
                                                  Color.fromARGB(255, 88, 88, 88),
                                              offset: Offset(4, 4),
                                              blurRadius: 15,
                                              spreadRadius: 1,
                                            ),
                                            // const BoxShadow(
                                            //   color: Colors.white,
                                            //   offset: Offset(-4, -4),
                                            //   blurRadius: 15,
                                            //   spreadRadius:
                                            //       -2, // how far the color effect spreads.
                                            // ),
                                          ],
                                    color: widget.iscolor
                                        ? backgroundColorfigma
                                        : Colors.white,
                                    borderRadius: BorderRadius.only(topRight:Radius.circular(10),bottomRight: Radius.circular(10)
                                    ),
                                  ),
                                  child: FractionalTranslation(
                                    translation: widget.height < 700
                                        ? Offset(0, -overlapFraction)
                                        : Offset(0, 0),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.location_on_outlined,
                                        size: widget.height < 700
                                            ? widget.width / 25
                                            : widget.width / 15,
                                      ),
                                      color: widget.iscolor
                                          ? Colors.white
                                          : backgroundColorfigma,
                                      onPressed: () {
                                        setState(() {
                                          isloccontexpn = !isloccontexpn;
                                          print(isloccontexpn);
                                          hightofcont = isloccontexpn
                                              ? widget.height / 5.5
                                              : 88;
                                          overlapFraction =
                                              isloccontexpn ? 0.25 : 0.5;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        isloccontexpn
                            ? Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: Row(
                                  children: [
                                    TextButton(onPressed: () {
                                      
                                    },
                                      child: Text(
                                        "Pune",
                                        style: GoogleFonts.bebasNeue(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color:!widget.iscolor? backgroundColorfigma:offwhite),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Container()
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
}



// Widget topnavigationbar(double height, double width, bool iscolor) {
//   double overlapFraction = 0.5;
// var hightofcont=height / 10;
//   return Stack(
//     children: [
//       Column(
//         children: [
//         // Container(
//         //   height: height / 12,
//         //   width: double.maxFinite,
//         //   decoration: const BoxDecoration(
//         //     color: Colors.white,
//         //     borderRadius: BorderRadius.only(
//         //       bottomLeft: Radius.circular(50),
//         //       bottomRight: Radius.circular(50),
//         //     ),
//         //   ),
//         //   child: Row(
//         //     mainAxisAlignment: MainAxisAlignment.spaceAround,
//         //     children: [
//         //       Container(
//         //         child: Center(
//         //             child: Image.asset(
//         //           "assets/images/group.png",
//         //           scale: 1,
//         //         )),
//         //         height: height / 10,
//         //         width: width / 7,
//         //         decoration: BoxDecoration(
//         //           shape: BoxShape.circle,
//         //           color: backgroundColorfigma,
//         //         ),
//         //       ),
//         //       SizedBox(
//         //         width: width / 3,
//         //       ),
//         //       Container(
//         //         child: Padding(
//         //           padding: const EdgeInsets.only(left: 5.0),
//         //           child: Center(
//         //             child: Image.asset(
//         //               "assets/images/person.png",
//         //             ),
//         //           ),
//         //         ),
//         //         height: height / 15,
//         //         width: width / 7,
//         //         decoration: BoxDecoration(
//         //           shape: BoxShape.circle,
//         //           color: backgroundColorfigma,
//         //         ),
//         //       ),
//         //     ],
//         //   ),
//         // ),
//         Padding(
//           padding: EdgeInsets.only(top: height / 22),
//           child: Align(
//             alignment: Alignment(0, -overlapFraction),
//             child: FractionalTranslation(
//               translation: Offset(0, -overlapFraction),
//               child: Container(
//                 height: hightofcont,
//                 width:width,
//                 decoration: BoxDecoration(
//                   color: iscolor ? backgroundColorfigma : Colors.white,
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(40.0),
//                     bottomRight: Radius.circular(40.0),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
                      
//                       Container(
//                         width: width / 6.5,
//                         decoration: BoxDecoration(
//                           boxShadow: iscolor?[
//                             BoxShadow(
//                               color: Color.fromARGB(255, 88, 88, 88),
//                               offset: Offset(-4, -4),
//                               blurRadius: 10,
//                               spreadRadius: -2,
//                             ),
//                             BoxShadow(
//                               color: Colors.black,
//                               offset: Offset(4, 4),
//                               blurRadius: 15,
//                               spreadRadius:
//                                   -2, // how far the color effect spreads.
//                             ),
//                           ]:[
//                             BoxShadow(
//                               color: Color.fromARGB(255, 88, 88, 88),
//                               offset: Offset(4, 4),
//                               blurRadius: 15,
//                               spreadRadius: 1,
//                             ),
//                             BoxShadow(
//                               color: Colors.white,
//                               offset: Offset(-4, -4),
//                               blurRadius: 15,
//                               spreadRadius:
//                                   -2, // how far the color effect spreads.
//                             ),
//                           ],
//                           color: iscolor ? backgroundColorfigma : Colors.white,
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(10),
//                           ),
//                         ),
//                         child: FractionalTranslation(
//                           translation: height<700?Offset(0, -overlapFraction):Offset(0, 0),
//                           child: IconButton(
//                             icon: Icon(
//                               Icons.search,
//                               size: height<700?width/25:width/15,
//                             ),
//                             color:
//                                 iscolor ? Colors.white : backgroundColorfigma,
//                             onPressed: () {},
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 11,
//                       ),
//                       Container(
//                         width: width / 7,
//                         decoration: BoxDecoration(
//                           boxShadow: iscolor?[
//                             BoxShadow(
//                               color: Color.fromARGB(255, 88, 88, 88),
//                               offset: Offset(-4, -4),
//                               blurRadius: 10,
//                               spreadRadius: -2,
//                             ),
//                             BoxShadow(
//                               color: Colors.black,
//                               offset: Offset(4, 4),
//                               blurRadius: 15,
//                               spreadRadius:
//                                   -2, // how far the color effect spreads.
//                             ),
//                           ]:[
//                             BoxShadow(
//                               color: Color.fromARGB(255, 88, 88, 88),
//                               offset: Offset(4, 4),
//                               blurRadius: 15,
//                               spreadRadius: 1,
//                             ),
//                             BoxShadow(
//                               color: Colors.white,
//                               offset: Offset(-4, -4),
//                               blurRadius: 15,
//                               spreadRadius:
//                                   -2, // how far the color effect spreads.
//                             ),
//                           ],
//                           color: iscolor ? backgroundColorfigma : Colors.white,
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(10),
//                           ),
//                         ),
//                         child: FractionalTranslation(
//                           translation: height<700?Offset(0, -overlapFraction):Offset(0, 0),
//                           child: IconButton(
//                             icon: Icon(
//                               Icons.location_on_outlined,
//                               size: height<700?width/25:width/15,
//                             ),
//                             color:
//                                 iscolor ? Colors.white : backgroundColorfigma,
//                             onPressed: () {
// hightofcont=height/5;
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ]),
//     ],
//   );
// }
