import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsFooterButtons extends StatefulWidget {
  const EventsFooterButtons(
      {Key? key,
      required this.width,
      required this.colorb,
      required this.textcolor})
      : super(key: key);

  final double width;
  final Color colorb;
  final Color textcolor;

  @override
  State<EventsFooterButtons> createState() => _EventsFooterButtonsState();
}

class _EventsFooterButtonsState extends State<EventsFooterButtons> {
  // bool _isFirstButtonTapped = false;
  void _onFirstButtonTap() {
    // setState(() {
    //   _isFirstButtonTapped = !_isFirstButtonTapped;
    // });
    Navigator.of(context).pushReplacementNamed('/allclubs');
  }

  bool _isSecondButtonTapped = true;
  void _onSecondButtonTap() {
    setState(() {
      _isSecondButtonTapped = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Positioned(
      bottom: 0,
      left: 0,
      child: SizedBox(
        height: height / 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: _onFirstButtonTap,
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(100),
                  ),
                  child: Container(
                    width: 2 * widget.width / 5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                        width: 5,
                      ),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(140),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Image.asset(
                                'assets/images/clubsicon.png',
                                width: 48.0,
                                height: 48.0,
                              ),
                            ),
                            const SizedBox(
                                height:
                                    8.0), // Add spacing between icon and text
                            Text(
                              "CLUBS",
                              style: GoogleFonts.bebasNeue(
                                fontSize: 18,
                                color: widget.textcolor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.5),
              child: FractionalTranslation(
                translation: const Offset(0, -0.5),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2C2F33),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 124, 120, 120),
                          blurRadius: 10,
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
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.qr_code_scanner,
                          size: 45,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: _onSecondButtonTap,
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                  ),
                  child: Container(
                    width: 2 * widget.width / 5,
                    decoration: BoxDecoration(
                      color: _isSecondButtonTapped
                          ? const Color(0xFFFFF0D3)
                          : Colors.white,
                      border: Border.all(
                        color: _isSecondButtonTapped
                            ? const Color(0xFFA98C52)
                            : Colors.white,
                        width: 5,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(140),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Image.asset(
                                'assets/images/eventsicon2.png',
                                width: 48.0,
                                height: 48.0,
                              ),
                            ),
                            const SizedBox(
                                height:
                                    8.0), // Add spacing between icon and text
                            Text(
                              "EVENTS",
                              style: GoogleFonts.bebasNeue(
                                fontSize: 18,
                                color: widget.textcolor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
