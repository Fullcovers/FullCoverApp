import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/Tablecard.dart';

class TabNavigation extends StatefulWidget {
  @override
  _TabNavigationState createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  int selectedIndex = 2;

  void onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.home,
                      color: selectedIndex == 1 ? Colors.blue : Colors.black),
                  onPressed: () => onTabSelected(1),
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.plus,
                      color: selectedIndex == 2 ? Colors.blue : Colors.black),
                  onPressed: () => onTabSelected(2),
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.user,
                      color: selectedIndex == 3 ? Colors.blue : Colors.black),
                  onPressed: () => onTabSelected(3),
                ),
              ],
            ),
          ),
          Container(
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 2,
                      color: selectedIndex == 1 ? Colors.blue : Colors.transparent,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 2,
                      color: selectedIndex == 2 ? Colors.blue : Colors.transparent,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 2,
                      color: selectedIndex == 3 ? Colors.blue : Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}