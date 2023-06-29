import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Models/Ticket.dart';
import 'package:venq_assessment/Services/BTS_Services/Table_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';

class TableAddTicket extends StatefulWidget {
  const TableAddTicket({super.key});

  @override
  State<TableAddTicket> createState() => _TableAddTicketState();
}

class _TableAddTicketState extends State<TableAddTicket> {
    late List<Ticket> tickets = [];
  bool loded = false;
  gettickets() async {
    tickets = await BTStable.getTableTickets(
        context: context, );
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
        double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColorfigma,
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
                                            BTStable
                                                .updatetableTickets(ava: int.parse(availableController.text),
                                              tableid: tickets[index].id,
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
                                            BTStable.deltableTickets(
                                              tableid: tickets[index].id,
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
              : Center(child: CircularProgressIndicator()),
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
                      BTStable.addtableTickets(
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
    ));
;
  }
}