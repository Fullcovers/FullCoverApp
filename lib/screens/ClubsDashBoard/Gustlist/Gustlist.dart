import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:venq_assessment/utils/Constants.dart';

class GustListPage extends StatefulWidget {
  const GustListPage({super.key});

  @override
  State<GustListPage> createState() => _GustListPageState();
}

class _GustListPageState extends State<GustListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Stack(
      children: [
        Image.asset(
            Constants.backgroundimage,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        Scaffold(body: Column(children: [],),),
      ],
    ));
  }
}