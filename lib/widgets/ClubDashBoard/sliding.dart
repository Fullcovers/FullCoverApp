import 'package:flutter/material.dart';

class SlidingSectionsPage extends StatefulWidget {
   SlidingSectionsPage({super.key,required this.height,required this.width});
  @override
  _SlidingSectionsPageState createState() => _SlidingSectionsPageState();
  double height;double width;
  
}

class _SlidingSectionsPageState extends State<SlidingSectionsPage> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  List<String> _sectionNames = ['All Bookings', 'Online', 'Walkins'];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height/2,color: Color(0xFF2C2F33),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: _sectionNames
                  .asMap()
                  .entries
                  .map(
                    (entry) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentPageIndex = entry.key;
                          _pageController.animateToPage(
                            _currentPageIndex,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          entry.value,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: _currentPageIndex == entry.key
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: [
                Container(height: widget.height/5.2,
                    child: Card(
                  color: Color(0xFFD9D9D9),
                )),
                Container(
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      'Section 2 Content',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
                Container(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildPageIndicator(0),
              buildPageIndicator(1),
              buildPageIndicator(2),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPageIndicator(int pageIndex) {
    double indicatorSize = 10.0;
    return Container(
      width: indicatorSize,
      height: indicatorSize,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPageIndex == pageIndex ? Colors.blue : Colors.grey,
      ),
    );
  }
}
