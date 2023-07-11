import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Services/BTS_Services/Gustlist_Services.dart';

import 'package:venq_assessment/Services/BTS_Services/Promoter_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Gustlist/Gustlistdetail.dart';
import 'package:venq_assessment/utils/Constants.dart';

import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/eventcard.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/searchbar.dart';

import '../../../Models/BTS_Models/Promoters.dart';
import 'AddPromoterDialog.dart';

class Promoters extends StatefulWidget {
  const Promoters({super.key});

  @override
  State<Promoters> createState() => _PromotersState();
}

class _PromotersState extends State<Promoters> {
  var promoters;
  var apromoters;

  bool loded = false;
  getpromoter() async {
    promoters = await Gustlist_Services.getallpromoters(context: context);
    setState(() {
      loded = true;
    });
  }

  void filterSearchResults(String query) {
    final suggestions = promoters.where((promoter) {
      final promotername = promoter['user']['name']['firstName'].toLowerCase();
      final input = query.toLowerCase();
      return promotername.contains(input) ? true : false;
    }).toList();
    setState(() {
      apromoters = promoters;
      promoters = suggestions;
    });
  }

  @override
  void initState() {
    super.initState();
    getpromoter();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            Constants.backgroundimage,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: backgroundColortransperent,
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
                  SizedBox(
                      height: height / 15,
                      width: width / 1.15,
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 11, right: 8),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            width: 400,
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: Color(0xFF2C2F33),
                              boxShadow: kElevationToShadow[6],
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3.0,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: TextField(
                                        onChanged: (value) {
                                          if (value == '') {
                                            setState(() {
                                              promoters=apromoters;
                                            });
                                          }
                                          filterSearchResults(value);
                                        },
                                        decoration: InputDecoration(
                                            hintText: 'Search Promoters',
                                            hintStyle:
                                                TextStyle(color: Colors.white),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                  ),
                                  // AnimatedContainer(
                                  //   duration: Duration(milliseconds: 400),
                                  //   child: Material(
                                  //     type: MaterialType.transparency,
                                  //     child: InkWell(
                                  //       borderRadius: BorderRadius.only(
                                  //           topLeft: Radius.circular(32),
                                  //           topRight: Radius.circular(32),
                                  //           bottomLeft: Radius.circular(32),
                                  //           bottomRight: Radius.circular(32)),
                                  //       child: Padding(
                                  //         padding:
                                  //             const EdgeInsets.only(right: 8),
                                  //         child: Icon(
                                  //           Icons.search,
                                  //           color: Colors.white,
                                  //         ),
                                  //       ),
                                  //       onTap: () {},
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: height / 50,
                  ),
                  SizedBox(
                      height: 6 * height / 8.5,
                      child: loded
                          ? Expanded(
                              child: ListView.builder(
                                itemCount: promoters!.length,
                                itemBuilder: (context, index) {
                                  final promoter = promoters[index];

                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      GustlistdetailPage(
                                                        prommoter: promoter,
                                                      )));
                                        },
                                        child: eventcard(
                                          height,
                                          width,
                                          promoter['user']['name']['firstName'],
                                          "Code: ${promoter['promo_code']}",
                                          20,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 42,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            )
                          : Constants.mycircularProgressIndicator())
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(
                  left: width / 5, right: width / 5, bottom: width / 20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    // PromoterServices().addPromoter(
                    //     context: context,
                    //     userid: "647f359f5c3c546ebb35fe6e",
                    //     discount: 2);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AddPromoterDialog();
                      },
                    ).then((selectedUser) {
                      // Handle the selected user
                      if (selectedUser != null) {
                        // Perform necessary actions with the selected user
                        print('Selected user: $selectedUser');
                      }
                    });
                  },
                  child: Container(
                    height: 58,
                    width: 190,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 120, 116, 116),
                          blurRadius: 20,
                          spreadRadius: -2,
                          offset: Offset(-2, -2),
                        ),
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 20,
                          spreadRadius: -2,
                          offset: Offset(2, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: botoncolor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "ADD PROMOTER",
                          style: GoogleFonts.bebasNeue(
                              color: Colors.white, fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// bottombutton(
//               "Add promoter",
//               const Icon(
//                 Icons.add,
//                 size: 35,
//               ),
//               context)