import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:venq_assessment/Models/Events.dart';
import 'package:venq_assessment/Services/BTS_Services/Table_Services.dart';
import 'package:venq_assessment/Services/BTS_Services/WalkIns_Services.dart';
import 'package:venq_assessment/Services/Event_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/utils/Utils.dart';

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

  // var time = DateFormat('kk:mm:ss').format(DateTime.now());
  var time = DateFormat.yMEd().add_jms().format(DateTime.now());

// var time=DateTime.parse(DateTime.now().toString());
  bool loded = false;
  List<String> eventnames = [];
  String? selectedValue = "Select";
  String eventid = "";
  getmyclubevents() async {    eventnames.add("Select");

    myclubevents = await EventsServices.getmyclubEvents(context: context);
    print(myclubevents.length);
    for (var i = 0; i < myclubevents.length; i++) {
      eventnames.add(myclubevents[i].name);
      print(eventnames[0]);

      
    }
    Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          // selectedValue=eventnames[0];

          loded = true;
        });
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fcount = 0;
    mcount = 0;
    ccount = 0;
    print("121");
    getmyclubevents();
  }

  final TextEditingController nameController = TextEditingController();
  String pnController = ' ';
  String emailController = ' ';
  int priceController = 0;
  int coverController = 0;
  int tableController = 0;
  @override
  Widget build(BuildContext context) {
    print(loded);
    DateFormat formatter1 = DateFormat('M/dd/yyyy');
    var date2 = formatter1.format(DateTime.now()).toString();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                                    ? SizedBox(
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
                                          items: eventnames.map((String entry) {
                                            return DropdownMenuItem<String>(
                                              value: entry,
                                              child: Text(entry),
                                            );
                                          }).toList(),
                                          hint: const Text('Select an item'),

                                          // After selecting the desired option,it will
                                          // change button value to selected value
                                          onChanged: (value) {
                                            setState(() {
                                              selectedValue = value;
                                            });
                                          },
                                        ),
                                      )
                                    : Constants.mycircularProgressIndicator()
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
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    pnController = value;
                                  });
                                  // pnController = value;
                                },
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
                              child: TextField(
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
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    emailController = value;
                                  });
                                  // emailController = value;
                                },
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
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    priceController = int.parse(value);
                                  });
                                },
                                style: GoogleFonts.sairaCondensed(
                                  color: const Color(0XFFFFFFFF),
                                  fontSize: 18,
                                ),
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: 'Price',
                                  hintStyle: GoogleFonts.sairaCondensed(
                                    color: const Color(0XFFAFAFAF),
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        goldalign
                            ? Padding(
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
                                      color:
                                          const Color.fromRGBO(108, 108, 108, 0.37),
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: Colors.black,
                                      )),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 15, left: 10),
                                    child: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          tableController = int.parse(value);
                                        });
                                        // tableController = value;
                                      },
                                      style: GoogleFonts.sairaCondensed(
                                        color: const Color(0XFFFFFFFF),
                                        fontSize: 18,
                                      ),
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        hintText: 'Table Number',
                                        hintStyle: GoogleFonts.sairaCondensed(
                                          color: const Color(0XFFAFAFAF),
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
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
                              child: TextField(
                                onChanged: ((value) {
                                  setState(() {
                                    coverController = int.parse(value);
                                  });
                                  // coverController = value;
                                }),
                                style: GoogleFonts.sairaCondensed(
                                  color: const Color(0XFFFFFFFF),
                                  fontSize: 18,
                                ),
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: 'Cover Points',
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
                                        (fcount + mcount + ccount * 2).toString(),
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
                                              left: 20.0, top: 0),
                                          child: Text(
                                            'Female',
                                            style: GoogleFonts.bebasNeue(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                                color: offwhite),
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
                                      mainAxisAlignment: MainAxisAlignment.center,
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
                                              left: 20.0, top: 0),
                                          child: Text(
                                            'Male',
                                            style: GoogleFonts.bebasNeue(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                                color: offwhite),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0, top: 12),
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
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
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
                                              left: 20.0, top: 0),
                                          child: Text(
                                            'Couple',
                                            style: GoogleFonts.bebasNeue(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                                color: offwhite),
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
                                BoxShadow(
                                  color: const Color(0xFF4A4E53).withOpacity(0.7),
                                  offset: const Offset(-2, -2),
                                  blurRadius: 20,
                                  spreadRadius: 0,
                                ),
                                BoxShadow(
                                  color: const Color(0xFF232527).withOpacity(0.9),
                                  offset: const Offset(8, 8),
                                  blurRadius: 30,
                                  spreadRadius: 0,
                                ),
                                BoxShadow(
                                  color: const Color(0xFF232527).withOpacity(0.8),
                                  offset: const Offset(2, 2),
                                  blurRadius: 6,
                                  spreadRadius: 0,
                                ),
                                BoxShadow(
                                  color: const Color(0xFF4A4E53).withOpacity(0.5),
                                  offset: const Offset(-2, -2),
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                if (goldalign) {
                                  if (nameController.text.isEmpty) {
                                    showSnackBar(context,
                                        "The name and date should be filled");
                                  }
                                  BTStable.createtable(
                                      tablenum: (tableController),
                                      cover: (coverController),
                                      price: (priceController),
                                      context: context,
                                      time: time.substring(15),
                                      date: date2,
                                      name: nameController.text,
                                      email: emailController,
                                      phone: pnController,
                                      number_of_people:
                                          (fcount + mcount + ccount * 2));
                                  nameController.text = " ";
                                  tableController = 0;
                                  coverController = 0;
                                  priceController = 0;
                                  emailController = " ";
                                  pnController = " ";
                                  fcount = 0;
                                  mcount = 0;
                                  ccount = 0;
                                } else {
                                  if (selectedValue == "Select") {
                                    if (nameController.text.isEmpty) {
                                      showSnackBar(context,
                                          "The name and date should be filled");
                                    }
                                    BTSwalkins.createWalkins(
                                        cover: (coverController),
                                        price: (priceController),
                                        context: context,
                                        name: nameController.text,
                                        email: emailController,
                                        phone: pnController,
                                        date: date1,
                                        number_of_people:
                                            (fcount + mcount + ccount * 2));
                                    nameController.text = " ";
                                    coverController = 0;
                                    priceController = 0;
                                    emailController = " ";
                                    pnController = " ";
                                    fcount = 0;
                                    mcount = 0;
                                    ccount = 0;
                                  } else {
                                    for (var i = 0; i < myclubevents.length; i++) {
                                      if (myclubevents[i].name == selectedValue) {
                                        eventid = myclubevents[i].id;
                                      }
                                    }
                                    if (nameController.text.isEmpty) {
                                      showSnackBar(context,
                                          "The name and date should be filled");
                                    }
                                    BTSwalkins.createWalkinsofevent(
                                        cover: (coverController),
                                        price: (priceController),
                                        context: context,
                                        name: nameController.text,
                                        email: emailController,
                                        phone: pnController,
                                        date: date1,
                                        number_of_people:
                                            (fcount + mcount + ccount * 2),
                                        eventid: eventid);
                                    nameController.text = " ";
                                    coverController = 0;
                                    priceController = 0;
                                    emailController = " ";
                                    pnController = " ";
                                    fcount = 0;
                                    mcount = 0;
                                    ccount = 0;
                                  }
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
                  : Container(height: height-100,child: Center(child: Constants.mycircularProgressIndicator())),
            ),
          ),
        ],
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
