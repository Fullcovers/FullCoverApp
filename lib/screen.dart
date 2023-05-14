import 'package:flutter/material.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 59, 55, 55),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 120, 116, 116),
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: Offset(-2, -2),
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(255, 40, 40, 41),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      color: const Color.fromARGB(255, 252, 248, 248),
                      icon: const Icon(
                        Icons.group_sharp,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 120, 116, 116),
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: Offset(-2, -2),
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(255, 40, 40, 41),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      color: const Color.fromARGB(255, 252, 248, 248),
                      icon: const Icon(
                        Icons.person_outline_sharp,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
              child: Container(
                height: 160,
                width: 360,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 120, 116, 116),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: Offset(-2, -2),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromARGB(255, 40, 40, 41),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "VIP Membership",
                            style: TextStyle(
                                color: Color.fromARGB(255, 191, 150, 26)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Balance",
                            style: TextStyle(
                                color: Color.fromARGB(255, 121, 118, 109),
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "\$ 1260.50",
                            style: TextStyle(
                                color: Color.fromARGB(255, 252, 251, 250),
                                fontSize: 28),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, right: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                color: const Color.fromARGB(255, 191, 150, 26),
                                icon: const Icon(CryptoFontIcons.BTC),
                              ),
                              const Text(
                                "1385",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 191, 150, 26),
                                    fontSize: 30),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                height: 495,
                width: 400,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(20.0)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Center(
                            child: Text(
                              "MY BOOKINGS",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Container(
                              height: 110,
                              width: 110,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20.0)),
                                color: Color.fromARGB(255, 59, 55, 55),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25.0))),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      CryptoFontIcons.BTC,
                                      size: 50,
                                      color: Color.fromARGB(255, 191, 150, 26),
                                    ),
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 1.0, left: 10.0),
                          child: Container(
                            height: 230,
                            width: 265,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 90,
                                  ),
                                  child: Center(
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.qr_code_outlined,
                                          size: 120,
                                        )),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 5, top: 90),
                                  child: Center(
                                    child: Text(
                                      "WATERZ",
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.call_to_action_sharp),
                                        iconSize: 30,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text("2x Couple"),
                                                Text("3x Stag")
                                              ],
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: const [
                                                        Icon(
                                                          Icons.access_time,
                                                        ),
                                                        Text("08:00 pm")
                                                      ],
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Icon(
                                                          Icons.location_on,
                                                        ),
                                                        Text("Take me There"),
                                                      ],
                                                    ),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                          child: Container(
                            height: 230,
                            width: 90,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: Text(
                                  "PREVIOUS BOOKINGS",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 246, 243, 243),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 120, 116, 116),
                              blurRadius: 2,
                              spreadRadius: 1,
                              offset: Offset(-2, -2),
                            ),
                          ],
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.qr_code_scanner,
                              size: 60,
                            )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            height: 63,
                            width: 140,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 59, 55, 55),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(60)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(right: 18.0),
                              child: Center(
                                  child: Text(
                                "CLUBS",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            height: 63,
                            width: 140,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 59, 55, 55),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 18.0),
                              child: Center(
                                  child: Text(
                                "EVENTS",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
