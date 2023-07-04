import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/Services/BTS_Services/Club_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/Tablecard.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';


class CarouselPage extends StatefulWidget {
  const CarouselPage({super.key});

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  List<CarouselImageModel> listofcarouselImage = [];
  bool loded = false;
  getclubCarouselImages() async {
    listofcarouselImage =
        await BTSClubServices.getCarouselImages(context: context);
    setState(() {
      loded = true;
    });
  }

  delmyclubimg(String name) async {
    BTSClubServices.delCarouselImages(context: context, name: name);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getclubCarouselImages();
  }

  XFile? image;

  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
    BTSClubServices.addCarouselImages(context:context, imageFile: image!,);
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(children: [
            HeaderContent(title: "Carousel Images",icon: Icon(null),),
            loded
                ? Expanded(
                    child: ListView.builder(
                      itemCount: listofcarouselImage.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: width,
                          height: height / 3.5,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(width: width/1.3,
                                        child: Text(
                                          listofcarouselImage[index].name,textAlign: TextAlign.left,
                                          style: GoogleFonts.bebasNeue(
                                              fontSize: 30, color: golden),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 40,
                                      ),
                                      Container(
                                        height: height / 10,
                                        child: Image.network(
                                            listofcarouselImage[index].imageUrl),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.delete),
                                        color: golden,
                                        onPressed: () async {
                                          delmyclubimg(
                                              listofcarouselImage[index].name);
                                          setState(() {
                                            loded = false;
                                          });
                                          await Future.delayed(
                                              const Duration(seconds: 2), () {
                                            getclubCarouselImages();
                                          });
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Center(
                    child: Constants.mycircularProgressIndicator()
                  ),
      ]),
      floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {},
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: golden,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        title: Text('Please choose media to select'),
                        content: Container(
                          height: MediaQuery.of(context).size.height / 6,
                          child: Column(
                            children: [
                              ElevatedButton(
                                //if user click this button, user can upload image from gallery
                                onPressed: () {
                                  Navigator.pop(context);
                                  getImage(ImageSource.gallery);
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.image),
                                    Text('From Gallery'),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                //if user click this button. user can upload image from camera
                                onPressed: () {
                                  Navigator.pop(context);
                                  getImage(ImageSource.camera);
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.camera),
                                    Text('From Camera'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
      ),
    ),
          ],
        ));
  }
}
