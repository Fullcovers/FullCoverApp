import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
   SearchBar({Key? key,required this.searchtext}) : super(key: key);
String searchtext;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 11, right: 8),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          width: 400,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Color(0xFF2C2F33),
            boxShadow: kElevationToShadow[6],
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color: Colors.white,
                width: 3.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: searchtext,
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32)),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
