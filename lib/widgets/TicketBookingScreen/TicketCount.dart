import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketCount extends StatefulWidget {
  const TicketCount({super.key, required this.price, required this.title});
  final String title;
  final String price;

  @override
  State<TicketCount> createState() => _TicketCountState();
}

class _TicketCountState extends State<TicketCount> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height / 10,
      width: double.maxFinite,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color(0XFF979797),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.title,
              style: GoogleFonts.mavenPro(
                color: const Color(0XFFFFFFFF),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Rs. ${widget.price}",
              style: GoogleFonts.sairaCondensed(
                color: const Color(0XFFFFFFFF),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              height: 32,
              width: 100,
              decoration: const BoxDecoration(
                color: Color(0XFFB59F68),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                    child: FractionalTranslation(
                      translation: const Offset(0, 0.05),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (count > 0) {
                              count--;
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.remove,
                          size: 15,
                        ),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.black.withOpacity(0.2),
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                          left: BorderSide(
                            color: Colors.black.withOpacity(0.2),
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                          right: BorderSide(
                            color: Colors.black.withOpacity(0.2),
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          count.toString(), // Use the dynamic count value
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: FractionalTranslation(
                      translation: const Offset(0, 0.05),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              count++;
                            });
                          },
                          icon: const Icon(Icons.add),
                          color: Colors.black,
                          iconSize: 15,
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
