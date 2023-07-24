import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:venq_assessment/Services/BTS_Services/Gustlist_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/PeopleList.dart';

class GustlistdetailPage extends StatefulWidget {
  var prommoter;

  GustlistdetailPage({super.key, required this.prommoter});
  @override
  State<GustlistdetailPage> createState() => _GustlistdetailPageState();
}

class _GustlistdetailPageState extends State<GustlistdetailPage> {
  var guistlist;var loded=false;
  getguistlist() async {
    guistlist = await Gustlist_Services.getpromotersbyid(
        context: context, promoterid: widget.prommoter['_id']);        print(widget.prommoter['_id']);

        setState(() {
          loded=true;
        });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getguistlist();
  }
  @override
  Widget build(BuildContext context) {
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
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: HeaderContent(title: "GustList"),
              ),
              
              // Text(
              //   widget.prommoter['user']['name']['firstName']+" "+widget.prommoter['user']['name']['lastName'],
              //   style: TextStyle(color: Colors.white),
              // ),
              loded?PeopleList(
                orders: guistlist,
                count: guistlist.length  ,
              ):Constants.mycircularProgressIndicator()

            ],
          ),
        ),
      ],
    ));
  }
}
