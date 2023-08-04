import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/Services/BTS_Services/Club_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';

class MyClub extends StatefulWidget {
  const MyClub({super.key});

  @override
  State<MyClub> createState() => _MyClubState();
}

class _MyClubState extends State<MyClub> {
  late ClubModel? club;
  bool isloded = false;
  loadclub() async {
    await      BTSClubServices.btsgetSingleClub(context: context);
    club=Constants.myclub;
    setState(() {
      print("object");
      isloded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadclub();
  }
List<String> elements = [];
  @override
  
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double ifontsize = 15;
    double ofontsize = 30; 

                                  elements= [
      "Bollywood",
      "Commercial",
      "Hip Hop",
      "Electronic",
      "Progressive",
      "Melodic House",
      "Rap"
    ];

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
          body: isloded
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      HeaderContent(title:club!.type_of=="club"?  "My Club":"My Resto"),
                      Container(
                        width: width,
                        height: height / 15,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              textAlign: TextAlign.center,
                              club!.name,
                              style: GoogleFonts.bebasNeue(
                                  fontSize: ofontsize, color: golden),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10),
                          child: Text(
                            textAlign: TextAlign.left,
                            "Address",
                            style: GoogleFonts.bebasNeue(
                                fontSize: 30, color: golden),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          final TextEditingController plotController =
                              TextEditingController();
                          final TextEditingController landmarkController =
                              TextEditingController();
                          final TextEditingController cityController =
                              TextEditingController();
                          final TextEditingController stateController =
                              TextEditingController();
                          final TextEditingController pcController =
                              TextEditingController();
                          plotController.text = club!.daddress.plot;
                          cityController.text = club!.daddress.city;
                          landmarkController.text = club!.daddress.landmark;
                          stateController.text = club!.daddress.state;
                          pcController.text = club!.daddress.postalcode;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                title: const Text("Update Ticket"),
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Form(
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: plotController,
                                          decoration: const InputDecoration(
                                            labelText: "Plot",
                                          ),
                                        ),
                                        TextFormField(
                                          controller: landmarkController,
                                          decoration: const InputDecoration(
                                            labelText: "Landmark",
                                          ),
                                        ),
                                        TextFormField(
                                          controller: cityController,
                                          decoration: const InputDecoration(
                                            labelText: "City",
                                          ),
                                        ),
                                        TextFormField(
                                          controller: stateController,
                                          decoration: const InputDecoration(
                                            labelText: "State",
                                          ),
                                        ),
                                        TextFormField(
                                          controller: pcController,
                                          decoration: const InputDecoration(
                                            labelText: "Postal code",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) {
                                        // If the button is pressed, return green, otherwise blue
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Colors.black;
                                        }
                                        return Colors.black;
                                      }),
                                    ),
                                    child: Text(
                                      "Update",
                                      style: GoogleFonts.sairaCondensed(
                                          fontSize: 15, color: golden),
                                    ),
                                    onPressed: () {
                                      BTSClubServices.updateclub(
                                          context: context,
                                          body: {
                                            "d_address": {
                                              "city": cityController.text,
                                              "plot": plotController.text,
                                              "postal_code": pcController.text,
                                              "state": stateController.text,
                                              "landmark":
                                                  landmarkController.text
                                            },
                                          },
                                          myclubid: club!.id);
                                      Navigator.pop(context);
                                      setState(() {
                                        isloded = false;
                                      });
                                      loadclub();
                                    },
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) {
                                        // If the button is pressed, return green, otherwise blue
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Colors.black;
                                        }
                                        return Colors.black;
                                      }),
                                    ),
                                    child: Text(
                                      "Cancel",
                                      style: GoogleFonts.sairaCondensed(
                                          fontSize: 15, color: golden),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          width: width,
                          height: height / 5,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Plot",
                                        style: GoogleFonts.sairaCondensed(
                                            fontSize: ifontsize, color: golden),
                                      ),
                                      Text(
                                        "landmark",
                                        style: GoogleFonts.sairaCondensed(
                                            fontSize: ifontsize, color: golden),
                                      ),
                                      Text(
                                        "city",
                                        style: GoogleFonts.sairaCondensed(
                                            fontSize: ifontsize, color: golden),
                                      ),
                                      Text(
                                        "state",
                                        style: GoogleFonts.sairaCondensed(
                                            fontSize: ifontsize, color: golden),
                                      ),
                                      Text(
                                        "postal_code",
                                        style: GoogleFonts.sairaCondensed(
                                            fontSize: ifontsize, color: golden),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ":",
                                        style: GoogleFonts.sairaCondensed(
                                            fontSize: ifontsize, color: golden),
                                      ),
                                      Text(
                                        ":",
                                        style: GoogleFonts.sairaCondensed(
                                            fontSize: ifontsize, color: golden),
                                      ),
                                      Text(
                                        ":",
                                        style: GoogleFonts.sairaCondensed(
                                            fontSize: ifontsize, color: golden),
                                      ),
                                      Text(
                                        ":",
                                        style: GoogleFonts.sairaCondensed(
                                            fontSize: ifontsize, color: golden),
                                      ),
                                      Text(
                                        ":",
                                        style: GoogleFonts.sairaCondensed(
                                            fontSize: ifontsize, color: golden),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          textAlign: TextAlign.left,
                                          club!.daddress.plot,
                                          style: GoogleFonts.sairaCondensed(
                                              fontSize: ifontsize,
                                              color: golden),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          textAlign: TextAlign.left,
                                          club!.daddress.landmark,
                                          style: GoogleFonts.sairaCondensed(
                                              fontSize: ifontsize,
                                              color: golden),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          textAlign: TextAlign.left,
                                          club!.daddress.city,
                                          style: GoogleFonts.sairaCondensed(
                                              fontSize: ifontsize,
                                              color: golden),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          textAlign: TextAlign.left,
                                          club!.daddress.state,
                                          style: GoogleFonts.sairaCondensed(
                                              fontSize: ifontsize,
                                              color: golden),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          textAlign: TextAlign.left,
                                          club!.daddress.postalcode,
                                          style: GoogleFonts.sairaCondensed(
                                              fontSize: ifontsize,
                                              color: golden),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10),
                          child: Text(
                            textAlign: TextAlign.left,
                            "Timings",
                            style: GoogleFonts.bebasNeue(
                                fontSize: 30, color: golden),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          final TextEditingController opensAtController =
                              TextEditingController();
                          final TextEditingController closesAtController =
                              TextEditingController();

                          opensAtController.text = club!.timings.opensAt;
                          closesAtController.text = club!.timings.closesAt;

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                title: const Text("Update"),
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Form(
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: opensAtController,
                                          decoration: const InputDecoration(
                                            labelText: "Opens At",
                                          ),
                                        ),
                                        TextFormField(
                                          controller: closesAtController,
                                          decoration: const InputDecoration(
                                            labelText: "Closes At",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) {
                                        // If the button is pressed, return green, otherwise blue
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Colors.black;
                                        }
                                        return Colors.black;
                                      }),
                                    ),
                                    child: Text(
                                      "Update",
                                      style: GoogleFonts.sairaCondensed(
                                          fontSize: 15, color: golden),
                                    ),
                                    onPressed: () {
                                      BTSClubServices.updateclub(
                                          context: context,
                                          body: {
                                            "timings": {
                                              "closesAt":
                                                  closesAtController.text,
                                              "opensAt": opensAtController.text
                                            },
                                          },
                                          myclubid: club!.id);
                                      Navigator.pop(context);
                                      setState(() {
                                        isloded = false;
                                      });
                                      loadclub();
                                    },
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) {
                                        // If the button is pressed, return green, otherwise blue
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Colors.black;
                                        }
                                        return Colors.black;
                                      }),
                                    ),
                                    child: Text(
                                      "Cancel",
                                      style: GoogleFonts.sairaCondensed(
                                          fontSize: 15, color: golden),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          width: width,
                          height: height / 10,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "opensAt",
                                        style: GoogleFonts.sairaCondensed(
                                            fontSize: ifontsize, color: golden),
                                      ),
                                      Text(
                                        "closesAt",
                                        style: GoogleFonts.sairaCondensed(
                                            fontSize: ifontsize, color: golden),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ":",
                                        style: GoogleFonts.sairaCondensed(
                                            fontSize: ifontsize, color: golden),
                                      ),
                                      Text(
                                        ":",
                                        style: GoogleFonts.sairaCondensed(
                                            fontSize: ifontsize, color: golden),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          textAlign: TextAlign.left,
                                          club!.timings.opensAt,
                                          style: GoogleFonts.sairaCondensed(
                                              fontSize: ifontsize,
                                              color: golden),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          textAlign: TextAlign.left,
                                          club!.timings.closesAt,
                                          style: GoogleFonts.sairaCondensed(
                                              fontSize: ifontsize,
                                              color: golden),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10),
                          child: Text(
                            textAlign: TextAlign.left,
                            "Days Open",
                            style: GoogleFonts.bebasNeue(
                                fontSize: 30, color: golden),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          final TextEditingController fromController =
                              TextEditingController();
                          final TextEditingController tillController =
                              TextEditingController();

                          fromController.text = club!.daysOpen.from;
                          tillController.text = club!.daysOpen.till;

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                title: const Text("Update"),
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Form(
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: fromController,
                                          decoration: const InputDecoration(
                                            labelText: "Opens At",
                                          ),
                                        ),
                                        TextFormField(
                                          controller: tillController,
                                          decoration: const InputDecoration(
                                            labelText: "Closes At",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) {
                                        // If the button is pressed, return green, otherwise blue
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Colors.black;
                                        }
                                        return Colors.black;
                                      }),
                                    ),
                                    child: Text(
                                      "Update",
                                      style: GoogleFonts.sairaCondensed(
                                          fontSize: 15, color: golden),
                                    ),
                                    onPressed: () {
                                      BTSClubServices.updateclub(
                                          context: context,
                                          body: {
                                            "days_open": {
                                              "from": fromController.text,
                                              "till": tillController.text
                                            },
                                          },
                                          myclubid: club!.id);
                                      Navigator.pop(context);
                                      setState(() {
                                        isloded = false;
                                      });
                                      loadclub();
                                    },
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) {
                                        // If the button is pressed, return green, otherwise blue
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Colors.black;
                                        }
                                        return Colors.black;
                                      }),
                                    ),
                                    child: Text(
                                      "Cancel",
                                      style: GoogleFonts.sairaCondensed(
                                          fontSize: 15, color: golden),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          width: width,
                          height: height / 10,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "From",
                                        style: GoogleFonts.sairaCondensed(
                                            fontSize: ifontsize, color: golden),
                                      ),
                                      Text(
                                        "To",
                                        style: GoogleFonts.sairaCondensed(
                                            fontSize: ifontsize, color: golden),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ":",
                                        style: GoogleFonts.sairaCondensed(
                                            fontSize: ifontsize, color: golden),
                                      ),
                                      Text(
                                        ":",
                                        style: GoogleFonts.sairaCondensed(
                                            fontSize: ifontsize, color: golden),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          textAlign: TextAlign.left,
                                          club!.daysOpen.from,
                                          style: GoogleFonts.sairaCondensed(
                                              fontSize: ifontsize,
                                              color: golden),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          textAlign: TextAlign.left,
                                          club!.daysOpen.till,
                                          style: GoogleFonts.sairaCondensed(
                                              fontSize: ifontsize,
                                              color: golden),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10),
                          child: Text(
                            textAlign: TextAlign.left,
                            "terms_and_condition",
                            style: GoogleFonts.bebasNeue(
                                fontSize: 30, color: golden),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          final TextEditingController tcController =
                              TextEditingController();

                          tcController.text = club!.termsAndCondition;

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                title: const Text("Update"),
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Form(
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: tcController,
                                          decoration: const InputDecoration(
                                            labelText: "Opens At",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) {
                                        // If the button is pressed, return green, otherwise blue
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Colors.black;
                                        }
                                        return Colors.black;
                                      }),
                                    ),
                                    child: Text(
                                      "Update",
                                      style: GoogleFonts.sairaCondensed(
                                          fontSize: 15, color: golden),
                                    ),
                                    onPressed: () {
                                      BTSClubServices.updateclub(
                                          context: context,
                                          body: {
                                            "terms_and_condition":
                                                tcController.text,
                                          },
                                          myclubid: club!.id);
                                      Navigator.pop(context);
                                      setState(() {
                                        isloded = false;
                                      });
                                      loadclub();
                                    },
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) {
                                        // If the button is pressed, return green, otherwise blue
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Colors.black;
                                        }
                                        return Colors.black;
                                      }),
                                    ),
                                    child: Text(
                                      "Cancel",
                                      style: GoogleFonts.sairaCondensed(
                                          fontSize: 15, color: golden),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          width: width,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                textAlign: TextAlign.left,
                                club!.termsAndCondition,
                                style: GoogleFonts.sairaCondensed(
                                    fontSize: ifontsize, color: golden),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10),
                          child: Text(
                            textAlign: TextAlign.left,
                            "Facilities",
                            style: GoogleFonts.bebasNeue(
                                fontSize: 30, color: golden),
                          ),
                        ),
                      ),
                      InkWell(onTap: (){
                        List<String>items=[];
                        for (var i = 0; i < 10; i++) {
                         club!.facilities.length>i? items.add(club!.facilities[i]):items.add("");
                        }
                        // items=club!.facilities;
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {    
                              return AlertDialog(
                                scrollable: true,
                                title: const Text("Update"),
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Form(
                                    child: Column(
                                      children: [
                                        Container(height: 200,width: width/1.1,
                                          child: ListView.builder(
                                            itemCount: items.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              return TextFormField(initialValue:items.length>index? items[index]:"",onChanged: (value) {
                                                items[index]=value;
                                              },
                                              // controller: elements[index],
                                              decoration: const InputDecoration(
                                                labelText: "Facilities",
                                              ),
                                            );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) {
                                        // If the button is pressed, return green, otherwise blue
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Colors.black;
                                        }
                                        return Colors.black;
                                      }),
                                    ),
                                    child: Text(
                                      "Update",
                                      style: GoogleFonts.sairaCondensed(
                                          fontSize: 15, color: golden),
                                    ),
                                    onPressed: () {
                                      BTSClubServices.updateclub(
                                          context: context,
                                          body: {
                                            "facilities":
                                                items,
                                          },
                                          myclubid: club!.id);
                                      Navigator.pop(context);
                                      setState(() {
                                        isloded = false;
                                      });
                                      loadclub();
                                    },
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) {
                                        // If the button is pressed, return green, otherwise blue
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Colors.black;
                                        }
                                        return Colors.black;
                                      }),
                                    ),
                                    child: Text(
                                      "Cancel",
                                      style: GoogleFonts.sairaCondensed(
                                          fontSize: 15, color: golden),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                      },
                        child: Container(
                          width: width,
                          height: height / 12,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: club!.facilities.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      club!.facilities[index],
                                      style: GoogleFonts.sairaCondensed(
                                          fontSize: ifontsize, color: golden),
                                    ),
                                  );
                                },  
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(child: Constants.mycircularProgressIndicator()),
        ),
      ],
    ));
  }
}
