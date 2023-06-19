import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:venq_assessment/Models/Events.dart';
import 'package:venq_assessment/Services/BTS_Services/WalkIns_Services.dart';
import 'package:venq_assessment/Services/Event_Services.dart';

import '../../../widgets/ClubDashBoard/HeaderContentWalkins.dart';

class Walkins extends StatefulWidget {
  const Walkins({super.key});

  @override
  State<Walkins> createState() => _WalkinsState();
}

class _WalkinsState extends State<Walkins> {
  DateTime? selectedDate;
  bool goldalign = false;
  int count = 0;
  List<Event> myclubevents = [];

  late int fcount;
  late int mcount;

  late int ccount;
  List<int> positiveValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  // Track the selected date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ??
          DateTime
              .now(), // Use selectedDate if available, else use current date
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate; // Update selectedDate if a date was picked
      });
    }
  }

  late String date1;
  String formatDate(DateTime? date) {
    if (date != null) {
      final DateFormat formatter = DateFormat('M/dd/yyyy');
      date1 = formatter.format(date).toString();
      return date1;
    }
    return 'Select Date';
  }

  bool loded = false;
  List<String> eventnames = [];
  String? selectedValue = "Select";
String eventid="";
  getmyclubevents() async {
    myclubevents = await EventsServices.getmyclubEvents(context: context);
    eventnames.add("Select");
    for (var i = 0; i < myclubevents.length; i++) {
      eventnames.add(myclubevents[i].name);
      print(eventnames[0]);

      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          // selectedValue=eventnames[0];

          loded = true;
        });
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fcount = 0;
    mcount = 0;
    ccount = 0;
    getmyclubevents();
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController pnController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF2C2F33),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: loded
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: HeaderContentWalkins(title: "WALKINS"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 20, left: 60, right: 60),
                      child: Container(
                        height: height / 20,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(34, 34, 34, 0.37),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                              ),
                              child: Text(
                                  selectedDate != null
                                      ? formatDate(selectedDate)
                                      : formatDate(DateTime.now()),
                                  style: GoogleFonts.sairaCondensed(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: IconButton(
                                onPressed: () {
                                  _selectDate(context);
                                },
                                icon: const Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0, right: 70.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Event",
                            style: GoogleFonts.sairaCondensed(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Optional",
                            style: GoogleFonts.sairaCondensed(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0XFF9D9D9D),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 20, left: 60, right: 60),
                      child: Container(
                        height: height / 20,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(34, 34, 34, 0.37),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            eventnames.isNotEmpty
                                ? Container(
                                    width: width - width / 3,
                                    child: DropdownButton(
                                      // Initial Value
                                      value: selectedValue,
                                      style: GoogleFonts.bebasNeue(
                                          fontSize: 20, color: Colors.white),
                                      dropdownColor: Colors.black,

                                      // Down Arrow Icon
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: eventnames
                                          
                                          .map((String entry) {
                                        return DropdownMenuItem<String>(
                                          value: entry,
                                          child: Text(entry),
                                        );
                                      }).toList(),
                                      hint: Text('Select an item'),

                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue = value;
                                        });
                                      },
                                    ),
                                  )
                                : CircularProgressIndicator(),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 10, left: 60, right: 60),
                      child: SizedBox(
                        height: height / 20,
                        width: double.maxFinite,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color:
                                    const Color.fromRGBO(108, 108, 108, 0.37),
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Align(
                              alignment: goldalign
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: FractionallySizedBox(
                                widthFactor: 0.5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0XFFB59F68),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        goldalign = !goldalign;
                                      });
                                    },
                                    child: Text(
                                      "Walkins",
                                      style: GoogleFonts.sairaCondensed(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        goldalign = !goldalign;
                                      });
                                    },
                                    child: Text(
                                      "Table",
                                      style: GoogleFonts.sairaCondensed(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 0,
                        left: 40,
                        right: 40,
                      ),
                      child: Container(
                        height: height / 20,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(108, 108, 108, 0.37),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 10),
                          child: TextFormField(
                            controller: nameController,
                            style: GoogleFonts.sairaCondensed(
                              color: const Color(0XFFFFFFFF),
                              fontSize: 18,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Name',
                              hintStyle: GoogleFonts.sairaCondensed(
                                color: const Color(0XFFAFAFAF),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 0,
                        left: 40,
                        right: 40,
                      ),
                      child: Container(
                        height: height / 20,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(108, 108, 108, 0.37),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 10),
                          child: TextFormField(
                            controller: pnController,
                            style: GoogleFonts.sairaCondensed(
                              color: const Color(0XFFFFFFFF),
                              fontSize: 18,
                            ),
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'Enter Mobile Number',
                              hintStyle: GoogleFonts.sairaCondensed(
                                color: const Color(0XFFAFAFAF),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 0,
                        left: 40,
                        right: 40,
                      ),
                      child: Container(
                        height: height / 20,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(108, 108, 108, 0.37),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 10),
                          child: TextFormField(
                            controller: emailController,
                            style: GoogleFonts.sairaCondensed(
                              color: const Color(0XFFFFFFFF),
                              fontSize: 18,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Enter Email',
                              hintStyle: GoogleFonts.sairaCondensed(
                                color: const Color(0XFFAFAFAF),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, right: 40.0, top: 10.0),
                      child: Container(
                        height: height / 4,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(108, 108, 108, 0.37),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 10),
                                  child: Text(
                                    "No.of People",
                                    style: GoogleFonts.sairaCondensed(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20.0, top: 10),
                                  child: Text(
                                    (fcount + mcount + ccount).toString(),
                                    style: GoogleFonts.bebasNeue(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Image.asset(
                                        'assets/images/woman1.png',
                                        width: 60.0,
                                        height: 60.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Container(
                                        height: 30,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Color(0XFFD9D9D9),
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0),
                                            child: DropdownButton<int>(
                                              value: fcount,
                                              hint: const Text(
                                                'Select a value',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              isDense: true,
                                              isExpanded: true,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  fcount = newValue!;
                                                });
                                              },
                                              // Dropdown menu items
                                              items: Dropdownitems,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Image.asset(
                                        'assets/images/male1.png',
                                        width: 60.0,
                                        height: 48.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 22),
                                      child: Container(
                                        height: 30,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: const Color(0XFFD9D9D9),
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0),
                                            child: DropdownButton<int>(
                                              value: mcount,
                                              hint: const Text(
                                                'Select a value',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              isDense: true,
                                              isExpanded: true,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  mcount = newValue!;
                                                });
                                              },
                                              // Dropdown menu items
                                              items: Dropdownitems,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Image.asset(
                                        'assets/images/couple1.png',
                                        width: 75.0,
                                        height: 55.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20.0,
                                        top: 10,
                                      ),
                                      child: Container(
                                        height: 30,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: const Color(0XFFD9D9D9),
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0),
                                            child: DropdownButton<int>(
                                              value: ccount,
                                              hint: const Text(
                                                'Select a value',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              isDense: true,
                                              isExpanded: true,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  ccount = newValue!;
                                                });
                                              },
                                              // Dropdown menu items
                                              items: Dropdownitems,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 70,
                        width: 140,
                        decoration: BoxDecoration(
                          color: const Color(0XFF35393E),
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF35393E),
                              Color(0xFF2D3135),
                            ],
                            stops: [0, 1],
                          ),
                          boxShadow: [
                            // BoxShadow(
                            //   color: const Color(0xFF4A4E53).withOpacity(0.7),
                            //   offset: const Offset(-2, -2),
                            //   blurRadius: 20,
                            //   spreadRadius: 0,
                            // ),
                            // BoxShadow(
                            //   color: const Color(0xFF232527).withOpacity(0.9),
                            //   offset: const Offset(8, 8),
                            //   blurRadius: 30,
                            //   spreadRadius: 0,
                            // ),
                            // BoxShadow(
                            //   color: const Color(0xFF232527).withOpacity(0.8),
                            //   offset: const Offset(2, 2),
                            //   blurRadius: 6,
                            //   spreadRadius: 0,
                            // ),
                            // BoxShadow(
                            //   color: const Color(0xFF4A4E53).withOpacity(0.5),
                            //   offset: const Offset(-2, -2),
                            //   blurRadius: 4,
                            //   spreadRadius: 0,
                            // ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            if (selectedValue == "Select") {
                              BTSwalkins.createWalkins(
                                  context: context,
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: pnController.text,
                                  date: date1,
                                  number_of_people: (fcount + mcount + ccount*2));
                            } else {
                              for (var i = 0; i < myclubevents.length; i++) {
                                if (myclubevents[i].name==selectedValue) {
                                  eventid=myclubevents[i].id;
                                }
                              }
                              BTSwalkins.createWalkinsofevent(
                                  context: context,
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: pnController.text,
                                  date: date1,
                                  number_of_people: (fcount + mcount + ccount*2),
                                  eventid: eventid);
                            }
                          },
                          child: Center(
                            child: Text(
                              "SAVE",
                              style: GoogleFonts.bebasNeue(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  // List<DropdownMenuItem<String>> get Dropdownitems1 {
  //   return [
  //     for (int i = 0; i < eventnames.length; i++)
  //       {
  //         DropdownMenuItem<String>(
  //           value: eventnames[0].toString(),
  //           child: Text(eventnames[0]),
  //         ),
  //       }
  //   ];
  // }

  List<DropdownMenuItem<int>> get Dropdownitems {
    return const [
      DropdownMenuItem<int>(
        value: 0,
        child: Text('0'),
      ),
      DropdownMenuItem<int>(
        value: 1,
        child: Text('1'),
      ),
      DropdownMenuItem<int>(
        value: 2,
        child: Text('2'),
      ),
      // Add more unique values here
      DropdownMenuItem<int>(
        value: 3,
        child: Text('3'),
      ),
      DropdownMenuItem<int>(
        value: 4,
        child: Text('4'),
      ),
      DropdownMenuItem<int>(
        value: 5,
        child: Text('5'),
      ),
      DropdownMenuItem<int>(
        value: 6,
        child: Text('6'),
      ),
      DropdownMenuItem<int>(
        value: 7,
        child: Text('7'),
      ),
      DropdownMenuItem<int>(
        value: 8,
        child: Text('8'),
      ),
      DropdownMenuItem<int>(
        value: 9,
        child: Text('9'),
      ),
      DropdownMenuItem<int>(
        value: 10,
        child: Text('10'),
      ),
    ];
  }
}
