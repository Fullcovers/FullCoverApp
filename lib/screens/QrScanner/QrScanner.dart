import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:venq_assessment/Models/UserModel.dart';
import 'package:venq_assessment/Providers/FetchUserProvider.dart';
import 'package:venq_assessment/Providers/OrderProvider.dart';
import 'package:venq_assessment/Providers/OrderValidationProvider.dart';
import 'package:venq_assessment/Services/Order_Services.dart';
import 'package:venq_assessment/Services/Ticket_Services.dart';
import 'package:venq_assessment/Services/User_Services.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/Tablecard.dart';
import '../../Providers/TicketProvider.dart';
import '../../Providers/UserProvider.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  int selectedCardIndex = -1;
  bool isDropdownVisible = false;
  String qrData = '';
  final String sdate = '';
  late OrderProvider orderprovider;
  @override
  void initState() {
    super.initState();
    orderprovider = Provider.of<OrderProvider>(context, listen: false);
    var userprovider = Provider.of<UserProvider>(context, listen: false);
    userprovider.loadToken();
    // _qrScanner();
  }

  Future<void> _qrScanner() async {
    var cameraStatus = await Permission.camera.status;
    if (cameraStatus.isGranted) {
      String? scannedData = await scanner.scan();
      setState(() {
        qrData = scannedData!;
      });
      OrderServices().checkvalidateQrCode(id: qrData, context: context);
      // userprovider.deleteToken();
    } else {
      var isGranted = await Permission.camera.request();
      if (isGranted.isGranted) {
        String? scannedData = await scanner.scan();
        setState(() {
          qrData = scannedData!;
        });
        OrderServices().checkvalidateQrCode(id: qrData, context: context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final orderprovider = Provider.of<OrderValidationProvider>(context);
    final fetchuserprovider = Provider.of<FetchUser>(context);
    final ticketprovider = Provider.of<TicketProvider>(context);
    DateTime? d = orderprovider.order?.createdAt;
    String formattedDate =
        d != null ? DateFormat('EE, d MMMM y').format(d) : '';

    String? firstname = fetchuserprovider.user?.data.name.firstName;
    String? email = fetchuserprovider.user?.data.email;
    String? phno = fetchuserprovider.user?.data.phoneNumber;
    int stagcount = 0;
    int couplecount = 0;
    if (ticketprovider.ticket?.name == "couple") {
      couplecount++;
    } else {
      stagcount++;
    }
    var moneyint = orderprovider.order?.total ?? 2000;
    final indianCurrencyFormat =
        NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);
    final formattedAmount = indianCurrencyFormat.format(moneyint);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF2C2F33),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  fetchuserprovider.user?.data.id != null
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 15.0),
                          child: Container(
                            height: 2.5 * height / 10,
                            width: width,
                            decoration:
                                const BoxDecoration(color: Color(0xFF2C2F33)),
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15.0, top: 5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (selectedCardIndex == index) {
                                              selectedCardIndex = -1;
                                              isDropdownVisible = false;
                                            } else {
                                              selectedCardIndex = index;
                                              isDropdownVisible = true;
                                            }
                                          });
                                        },
                                        child: Card(
                                          color: const Color(0xFFD9D9D9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Container(
                                            height: height / 15,
                                            width: width,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFD9D9D9),
                                                borderRadius:
                                                    isDropdownVisible &&
                                                            index ==
                                                                selectedCardIndex
                                                        ? const BorderRadius
                                                            .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    15.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    15.0),
                                                          )
                                                        : BorderRadius.circular(
                                                            20.0)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0),
                                                  child: Text(
                                                    firstname!,
                                                    style: GoogleFonts
                                                        .sairaCondensed(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 20.0),
                                                  child: Text(
                                                    formattedAmount,
                                                    style:
                                                        GoogleFonts.bebasNeue(
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (isDropdownVisible &&
                                        index ==
                                            selectedCardIndex) // Add this condition
                                      FractionalTranslation(
                                        translation: const Offset(0, -0.07),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15.0, right: 15.0),
                                          child: Card(
                                            color: const Color.fromRGBO(
                                                217, 217, 217, 0.33),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(15.0),
                                                bottomRight:
                                                    Radius.circular(15.0),
                                              ),
                                            ),
                                            child: Container(
                                              height: height / 7,
                                              width: width,
                                              decoration: const BoxDecoration(
                                                color: Color.fromRGBO(
                                                    217, 217, 217, 0.33),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(15.0),
                                                  bottomRight:
                                                      Radius.circular(15.0),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20.0,
                                                            top: 20.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Tickets",
                                                          style: GoogleFonts
                                                              .sairaCondensed(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Stag x$stagcount",
                                                          style: GoogleFonts
                                                              .sairaCondensed(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        FractionalTranslation(
                                                          translation:
                                                              const Offset(
                                                                  0, -0.2),
                                                          child: Text(
                                                            "Couple x$couplecount",
                                                            style: GoogleFonts
                                                                .sairaCondensed(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20.0,
                                                            top: 20.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          formattedDate,
                                                          style: GoogleFonts
                                                              .sairaCondensed(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: const Color(
                                                                      0XFFB59F68)),
                                                        ),
                                                        Text(
                                                          phno!,
                                                          style: GoogleFonts
                                                              .sairaCondensed(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        Text(
                                                          email!,
                                                          style: GoogleFonts
                                                              .sairaCondensed(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
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
                        )
                      : const SizedBox(
                          height: 10,
                        ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: InkWell(
                          onTap: () {
                            _qrScanner();
                          },
                          child: Container(
                            height: 58,
                            width: 190,
                            decoration: const BoxDecoration(
                              boxShadow: [
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color(0xFF2C2F33),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Open QR code",
                                  style: GoogleFonts.bebasNeue(
                                      color: Colors.white, fontSize: 25),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: InkWell(
                          onTap: () {
                            UserServices().getUserDetails(
                                context: context,
                                userId: orderprovider.order?.user);
                            TicketServices().getTicketById(
                              context: context,
                              ticketId: orderprovider.order?.items[0].ticket,
                            );
                          },
                          child: Container(
                            height: 58,
                            width: 190,
                            decoration: const BoxDecoration(
                              boxShadow: [
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color(0xFF2C2F33),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "GET TICKET DETAILS",
                                  style: GoogleFonts.bebasNeue(
                                      color: Colors.white, fontSize: 25),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: InkWell(
                      onTap: () {
                        OrderServices()
                            .validateQrCode(id: qrData, context: context);
                      },
                      child: Container(
                        height: 58,
                        width: 190,
                        decoration: const BoxDecoration(
                          boxShadow: [
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
                          color: Color(0xFF2C2F33),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "VALIDATE",
                              style: GoogleFonts.bebasNeue(
                                  color: Colors.white, fontSize: 25),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
