import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:venq_assessment/Services/BTS_Services/Gustlist_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Gustlist/Gustlistdetail.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/eventcard.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/searchbar.dart';

class GustListPage extends StatefulWidget {
  const GustListPage({super.key});

  @override
  State<GustListPage> createState() => _GustListPageState();
}

class _GustListPageState extends State<GustListPage> {
  var promoters;
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
      return promotername.contains(input)?true:false;
    }).toList();
    setState(() {
      promoters=suggestions;
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
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: HeaderContent(title: "GustList"),
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
                                      if (value=="") {
                                        getpromoter();
                                      }
                                      filterSearchResults(value);
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Search Promoters",
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 400),
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: InkWell(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(32),
                                        topRight: Radius.circular(32),
                                        bottomLeft: Radius.circular(32),
                                        bottomRight: Radius.circular(32)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: height / 50,
              ),
              loded
                  ? Expanded(
                      child: 
                      ListView.builder(
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
                  : Constants.mycircularProgressIndicator()
            ],
          ),
        ),
      ],
    ));
  }
}
