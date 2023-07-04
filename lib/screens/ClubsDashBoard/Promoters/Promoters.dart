import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:venq_assessment/Services/BTS_Services/Promoter_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
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
                      child: SearchBar(
                        searchtext: 'Search Promoters',
                      )),
                  SizedBox(
                    height: height / 50,
                  ),
                  SizedBox(
                    height: 6 * height / 10,
                    child: FutureBuilder<List<PromoterModel>>(
                      future: PromoterServices().getAllPromoters(context: context),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return  Center(
                            child: Constants.mycircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else {
                          final promoters = snapshot.data;

                          return ListView.builder(
                            itemCount: promoters!.length,
                            itemBuilder: (context, index) {
                              final promoter = promoters[index];

                              return Column(
                                children: [
                                  eventcard(
                                    height,
                                    width,
                                    promoter.user.name.firstName,
                                    "Code: ${promoter.promoCode}",
                                    20,
                                  ),
                                  SizedBox(
                                    height: height / 42,
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                  )
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
                    decoration:  BoxDecoration(
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
                          padding: const EdgeInsets.only(right:8.0),
                          child: Icon(Icons.add,color: Colors.white,),
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