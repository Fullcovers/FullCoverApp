import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderContent extends StatelessWidget {
  const HeaderContent({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
          Text(
            title,
            style: GoogleFonts.bebasNeue(
              fontSize: 28,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
