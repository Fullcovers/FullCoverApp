import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketSending extends StatelessWidget {
  const TicketSending({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF2C2F33),
      body: Column(
        children: [
          Container(
            height: height / 5,
            width: double.maxFinite,
            decoration: const BoxDecoration(color: Color(0XFF373B40)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                          child: Text(
                            "FREQ",
                            style: GoogleFonts.bebasNeue(
                              color: const Color(0XFFF0F0F3),
                              fontSize: 36,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                          child: Text(
                            "Pune",
                            style: GoogleFonts.sairaCondensed(
                              color: const Color(0XFFB59F68),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.location_on_outlined),
                        ),
                        FractionalTranslation(
                          translation: const Offset(-0.05, 0),
                          child: Text(
                            "Bisht Bhwan Compound, Tallital,Naintal",
                            style: GoogleFonts.sairaCondensed(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0XFFBCBCBC),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0, left: 20.0),
                          child: Text(
                            "Sat 13 May,2023",
                            style: GoogleFonts.sairaCondensed(
                              color: const Color(0XFFB59F68),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 0.0),
                          child: Text(
                            "19:00 Hrs-23.45 Hrs",
                            style: GoogleFonts.sairaCondensed(
                              color: const Color(0XFFFFFFFF),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                FractionalTranslation(
                  translation: const Offset(1.5, -1),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.close,
                        size: 24,
                        color: Color(0XFFF0F0F3),
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: 20, bottom: 20, left: 40.0, right: 40.0),
            child: Container(
              height: height / 4,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: const Color(0xFF2C2F33),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Where should we send you tickets",
                    style: GoogleFonts.sairaCondensed(
                      color: const Color(0XFFFFFFFF),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    child: Container(
                      height: height / 15,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: const Color(0xFF2C2F33),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.white,
                          )),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: SingleChildScrollView(
                          child: Container(
                            height: height / 15,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: const Color(0xFF2C2F33),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              children: [
                                FractionalTranslation(
                                  translation: const Offset(0, -0.32),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      '+91',
                                      style: GoogleFonts.sairaCondensed(
                                        color: const Color(0XFFFFFFFF),
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                const VerticalDivider(
                                  color: Color(0XFF494E58),
                                  thickness: 1,
                                ),
                                Expanded(
                                  child: FractionalTranslation(
                                    translation: const Offset(0, -0.2),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: TextFormField(
                                        style: GoogleFonts.sairaCondensed(
                                          color: const Color(0XFFFFFFFF),
                                          fontSize: 20,
                                        ),
                                        keyboardType: TextInputType.phone,
                                        decoration: InputDecoration(
                                          hintText: 'Phone Number',
                                          hintStyle: GoogleFonts.sairaCondensed(
                                            color: const Color(0XFFFFFFFF),
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      height: height / 15,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: const Color(0xFF2C2F33),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.white,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          style: GoogleFonts.sairaCondensed(
                            color: const Color(0XFFFFFFFF),
                            fontSize: 20,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: GoogleFonts.sairaCondensed(
                              color: const Color(0XFFFFFFFF),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 3 * height / 10,
          ),
          Flexible(
            child: Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Color(0XFFD9D9D9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 3,
                        width: width / 4,
                        color: const Color(0XFFB59F68),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 0.0),
                              child: Text(
                                "Pay Using",
                                style: GoogleFonts.sairaCondensed(
                                    color: const Color(0XFF222222),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                "Google Pay",
                                style: GoogleFonts.sairaCondensed(
                                    color: const Color(0XFF222222),
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0, top: 10),
                          child: Container(
                            height: height / 10,
                            width: 1.5,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Container(
                            height: 45,
                            width: 190,
                            decoration: BoxDecoration(
                                color: const Color(0XFFB59F68),
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Pay",
                                        style: GoogleFonts.sairaCondensed(
                                            color: const Color(0XFF222222),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  Text(
                                    "Rs. 3116",
                                    style: GoogleFonts.sairaCondensed(
                                        color: const Color(0XFF222222),
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          )
        ],
      ),
    ));
  }
}
