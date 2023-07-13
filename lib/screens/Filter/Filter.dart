import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Events/EventScreenaccgeneres.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/Tablecard.dart';
import 'package:venq_assessment/widgets/CustumPageRoute.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  int elementlidex = 0;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return golden;
  }

  List<bool> isChecked = [];
  List<String> selectedgeneres = [];
  Widget build(BuildContext context) {
    Map<String, List<String>> elements = {};
    elements["Music"] = [
      "Bollywood",
      "Commercial",
      "Hip Hop",
      "Electronic",
      "Progressive",
      "Melodic House",
      "Rap"
    ];
    elements["Popularity"] = ["High to Low", "Low to High"];

    var elementlist = elements.entries.toList();
    print(elementlist[elementlidex].value);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    for (var i = 0; i < elementlist[elementlidex].value.length; i++) {
      isChecked.add(false);
    }
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
          body: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: height / 20,
                  ),
                  Container(
                      child: Row(
                    children: [
                      Container(
                        color: Colors.transparent,
                        width: width / 2.2,
                        height: height - (height / 10.5),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: elements.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var entryList = elements.entries.toList();

                                  return Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            elementlidex = index;
                                            isChecked = [];
                                            selectedgeneres = [];
                                            print(elementlidex);
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(left:18.0),
                                          child: Text(entryList[index].key,
                                              style: GoogleFonts.sairaCondensed(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      Divider(
                                        color: golden,
                                        thickness: 0.4,
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          color: backgroundColortransperent,
                          width: width - (width / 2.2),
                          height: height - (height / 10.5),
                          child: ListView.builder(
                            itemCount: elementlist[elementlidex].value.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                                getColor),
                                        checkColor: Colors.black,
                                        value: isChecked[index],
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked[index] = value!;
                                            selectedgeneres.add(
                                                elementlist[elementlidex]
                                                    .value[index]);
                                          });
                                        },
                                      ),
                                      Text(
                                          elementlist[elementlidex]
                                              .value[index],
                                          style: GoogleFonts.sairaCondensed(
                                              // fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: Colors.white)),
                                    ],
                                  ),
                                  // Divider(
                                  //   color: Colors.white,
                                  //   thickness: 1,
                                  // )
                                ],
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  )),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              //<-- SEE HERE
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0,
                                  bottom: 8.0,
                                  right: 18.0,
                                  left: 18.0),
                              child: Container(
                                width: width / 7,
                                height: height / 20,
                                child: Center(
                                  child: Text("Cancel",
                                      style: GoogleFonts.sairaCondensed(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24,
                                          color: golden)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(ScaleTransitionPageRoute(
                                child: EventScreenaccgeneres(
                              generes: selectedgeneres,
                            )));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              //<-- SEE HERE
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0,
                                  bottom: 8.0,
                                  right: 18.0,
                                  left: 18.0),
                              child: Container(
                                width: width / 7,
                                height: height / 20,
                                child: Center(
                                  child: Text("Save",
                                      style: GoogleFonts.sairaCondensed(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24,
                                          color: golden)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
