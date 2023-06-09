import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPeople extends StatelessWidget {
  final String title;
  const SearchPeople({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 40, right: 40),
      child: Container(
        height: height / 20,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(34, 34, 34, 0.37),
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
              ),
              child: Text(title,
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
                  // Show the date picker on icon press
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
