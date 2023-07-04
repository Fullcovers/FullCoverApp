import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Models/Ticket.dart';
import 'package:venq_assessment/Services/BTS_Services/Ticket_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';

class EventAddTickets extends StatefulWidget {
  String eventid;
  EventAddTickets({super.key, required this.eventid});

  @override
  State<EventAddTickets> createState() => _EventAddTicketsState();
}

class _EventAddTicketsState extends State<EventAddTickets> {
  late List<Ticket> tickets = [];
  bool loded = false;
  gettickets() async {
    tickets = await BTSTicketServices.getEventTickets(
        context: context, eventid: widget.eventid);
    setState(() {
      loded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    gettickets();
  }

  @override
  Widget build(BuildContext context) {
    print("widget.eventid");
    print(widget.eventid);

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
      body: RefreshIndicator(
            onRefresh: () async {
              setState(() {
                loded = false;
                gettickets();
              });
            },
            child: Column(children: [
              HeaderContent(title: "Tickets"),
              loded
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: tickets.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    final TextEditingController nameController =
                                        TextEditingController();
                                    final TextEditingController crossedController =
                                        TextEditingController();
                                    final TextEditingController currentController =
                                        TextEditingController();
                                    final TextEditingController
                                        availableController =
                                        TextEditingController();
                                    nameController.text = tickets[index].name;
                                    nameController.text = tickets[index].name;
                                    crossedController.text =
                                        tickets[index].crossed.toString();
                                    currentController.text =
                                        tickets[index].current.toString();
                                    availableController.text =
                                        tickets[index].available.toString();

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
                                                    controller: nameController,
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText: "Name",
                                                      icon: Icon(Icons.account_box),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller: crossedController,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText: "Price",
                                                      icon: Icon(Icons
                                                          .monetization_on_outlined),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller: currentController,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText:
                                                          "Price with Discount",
                                                      icon: Icon(Icons
                                                          .monetization_on_outlined),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller: availableController,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText:
                                                          "Available Tickets",
                                                      icon: Icon(Icons
                                                          .event_available_sharp),
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
                                                    MaterialStateProperty
                                                        .resolveWith((states) {
                                                  // If the button is pressed, return green, otherwise blue
                                                  if (states.contains(
                                                      MaterialState.pressed)) {
                                                    return Colors.black;
                                                  }
                                                  return Colors.black;
                                                }),
                                              ),
                                              child: Text(
                                                "Submit",
                                                style: GoogleFonts.sairaCondensed(
                                                    fontSize: 15, color: golden),
                                              ),
                                              onPressed: () {
                                                BTSTicketServices
                                                    .updateeventTickets(
                                                  eventid: widget.eventid,
                                                  context: context,
                                                  name: nameController.text,
                                                  crossed: int.parse(
                                                      crossedController.text),
                                                  current: int.parse(
                                                      currentController.text),
                                                );
                                                Navigator.pop(context);
                                                setState(() {
                                                  loded = false;
                                                  gettickets();
                                                });
                                              },
                                            ),
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .resolveWith((states) {
                                                  // If the button is pressed, return green, otherwise blue
                                                  if (states.contains(
                                                      MaterialState.pressed)) {
                                                    return Colors.black;
                                                  }
                                                  return Colors.black;
                                                }),
                                              ),
                                              child: Text(
                                                "Delete",
                                                style: GoogleFonts.sairaCondensed(
                                                    fontSize: 15, color: golden),
                                              ),
                                              onPressed: () {
                                                BTSTicketServices.deleventTickets(
                                                  eventid: widget.eventid,
                                                  context: context,
                                                  name: nameController.text,
                                                );
                                                Navigator.pop(context);
                                                setState(() {
                                                  loded = false;
                                                  gettickets();
                                                });
                                              },
                                            ),
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .resolveWith((states) {
                                                  // If the button is pressed, return green, otherwise blue
                                                  if (states.contains(
                                                      MaterialState.pressed)) {
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
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      color: Colors.black,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              tickets[index].name,
                                              style: GoogleFonts.bebasNeue(
                                                  fontSize: 30, color: golden),
                                            ),
                                            SizedBox(
                                              height: height / 40,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Available Tickets",
                                                      style: GoogleFonts
                                                          .sairaCondensed(
                                                              fontSize: 15,
                                                              color: golden),
                                                    ),
                                                    Text(
                                                      "Tickets Price",
                                                      style: GoogleFonts
                                                          .sairaCondensed(
                                                              fontSize: 15,
                                                              color: golden),
                                                    ),
                                                    Text(
                                                      "Tickets Price with Discount",
                                                      style: GoogleFonts
                                                          .sairaCondensed(
                                                              fontSize: 15,
                                                              color: golden),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      tickets[index]
                                                          .available
                                                          .toString(),
                                                      style: GoogleFonts
                                                          .sairaCondensed(
                                                              fontSize: 15,
                                                              color: golden),
                                                    ),
                                                    Text(
                                                      tickets[index]
                                                          .crossed
                                                          .toString(),
                                                      style: GoogleFonts
                                                          .sairaCondensed(
                                                              fontSize: 15,
                                                              color: golden),
                                                    ),
                                                    Text(
                                                      tickets[index]
                                                          .current
                                                          .toString(),
                                                      style: GoogleFonts
                                                          .sairaCondensed(
                                                              fontSize: 15,
                                                              color: golden),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    )
                  : Center(child: Constants.mycircularProgressIndicator()),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              final TextEditingController nameController = TextEditingController();
              final TextEditingController priceController = TextEditingController();
              final TextEditingController discpriceController =
                  TextEditingController();
              final TextEditingController availableController =
                  TextEditingController();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: const Text("Add Ticket"),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                labelText: "Name",
                                icon: Icon(Icons.account_box),
                              ),
                            ),
                            TextFormField(
                              controller: priceController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: "Price",
                                icon: Icon(Icons.monetization_on_outlined),
                              ),
                            ),
                            TextFormField(
                              controller: discpriceController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: "Price with Discount",
                                icon: Icon(Icons.monetization_on_outlined),
                              ),
                            ),
                            TextFormField(
                              controller: availableController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: "Available Tickets",
                                icon: Icon(Icons.event_available_sharp),
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
                              MaterialStateProperty.resolveWith((states) {
                            // If the button is pressed, return green, otherwise blue
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.black;
                            }
                            return Colors.black;
                          }),
                        ),
                        child: Text(
                          "Submit",
                          style: GoogleFonts.sairaCondensed(
                              fontSize: 15, color: golden),
                        ),
                        onPressed: () {
                          BTSTicketServices.addEventTickets(
                              eventid: widget.eventid,
                              context: context,
                              name: nameController.text,
                              crossed: int.parse(priceController.text),
                              current: int.parse(discpriceController.text),
                              available: int.parse(availableController.text));
                          Navigator.pop(context);
                          setState(() {
                            loded = false;
                            gettickets();
                          });
                        },
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                            // If the button is pressed, return green, otherwise blue
                            if (states.contains(MaterialState.pressed)) {
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
            child: Icon(
              Icons.add,
              color: golden,
            ),
      ),
    ),
          ],
        ));
  }
}
