import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/SearchPeople.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BarMenu extends StatefulWidget {
  const BarMenu({super.key});

  @override
  State<BarMenu> createState() => _BarMenuState();
}

class _BarMenuState extends State<BarMenu> {
  int selectedCardIndex = -1;
  bool isDropdownVisible = false;
  @override
  Widget build(BuildContext context) {
    int moneyint = 350;
    final indianCurrencyFormat =
        NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);
    final formattedAmount = indianCurrencyFormat.format(moneyint);
    final formattedAmount2 = indianCurrencyFormat.format(250);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF2C2F33),
        body: Column(
          children: [
             HeaderContent(title: 'BAR MENU'),
            const SearchPeople(
              title: "Search Drinks",
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
              child: Container(
                height: 6 * height / 10,
                width: width,
                decoration: const BoxDecoration(color: Color(0xFF2C2F33)),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 5),
                          child: Card(
                            color: Color(0xFF2C2F33),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              height: height / 15,
                              width: width,
                              decoration: BoxDecoration(
                                  borderRadius: isDropdownVisible &&
                                          index == selectedCardIndex
                                      ? const BorderRadius.only(
                                          topLeft: Radius.circular(15.0),
                                          topRight: Radius.circular(15.0),
                                        )
                                      : BorderRadius.circular(20.0)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      "Whiskey",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontFamily: FontAwesomeIcons
                                            .solidCircle.fontFamily,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (selectedCardIndex == index) {
                                            selectedCardIndex =
                                                -1; // Deselect if already selected
                                            isDropdownVisible = false;
                                          } else {
                                            selectedCardIndex =
                                                index; // Select the tapped card
                                            isDropdownVisible = true;
                                          }
                                        });
                                      },
                                      icon: isDropdownVisible &&
                                              index == selectedCardIndex
                                          ? const Icon(
                                              FontAwesome.minus,
                                              color: Colors.white,
                                              size: 15,
                                            )
                                          : const Icon(
                                              FontAwesome.plus,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (isDropdownVisible &&
                            index == selectedCardIndex) // Add this condition
                          FractionalTranslation(
                            translation: const Offset(0, -0.07),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 30.0, right: 30.0),
                              child: Card(
                                color: const Color(0xFF2C2F33),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15.0),
                                    bottomRight: Radius.circular(15.0),
                                  ),
                                ),
                                child: Container(
                                  height: 27 * height / 100,
                                  width: width,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF2C2F33),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15.0),
                                      bottomRight: Radius.circular(15.0),
                                    ),
                                  ),
                                  child: ListView.builder(
                                    itemCount: 4,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Container(
                                          height: height / 13,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                width: 1,
                                                color: const Color(0XFFB59F68),
                                              )),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Fireball Shot",
                                                style:
                                                    GoogleFonts.sairaCondensed(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              FittedBox(
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: formattedAmount,
                                                    style:
                                                        GoogleFonts.bebasNeue(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0XFF8C8C8C),
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      decorationColor:
                                                          const Color(
                                                              0XFF8C8C8C),
                                                      decorationThickness: 1.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              FittedBox(
                                                child: Text(
                                                  formattedAmount2,
                                                  style: GoogleFonts.bebasNeue(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  FontAwesome.edit,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: height / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: 60,
                    width: 4.5 * width / 10,
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
                          offset: const Offset(-6, -6),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesome.plus,
                              size: 25,
                              color: Colors.white,
                            )),
                        FractionalTranslation(
                          translation: const Offset(-0.13, 0),
                          child: Text(
                            "ADD TYPE",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                    height: 60,
                    width: 4.5 * width / 10,
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
                          offset: const Offset(-6, -6),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesome.plus,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                        FractionalTranslation(
                          translation: const Offset(-0.13, 0),
                          child: Text(
                            "ADD DRINK",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
