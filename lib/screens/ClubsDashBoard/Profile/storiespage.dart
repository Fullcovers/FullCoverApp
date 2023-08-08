import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:venq_assessment/Services/BTS_Services/Stories_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/Services/uploadimage.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';

class Storiespage extends StatefulWidget {
  const Storiespage({super.key});

  @override
  State<Storiespage> createState() => _StoriespageState();
}

class _StoriespageState extends State<Storiespage> {
  dynamic mystories;
  bool loded = false;
  getstories() async {
    mystories = await StoriesServices.getstories(context: context);
    print(mystories['data'].length);
    setState(() {
      loded = true;
    });
  }

  @override
  void initState() {
    getstories();
    super.initState();
  }

  bool uploading = false;
  final ImagePicker picker = ImagePicker();
  Future uploadstorie(ImageSource media) async {
    setState(() {
      uploading = true;
    });
    var img = await picker.pickImage(source: media);

    String? url = await Upload().uploadimage(img!);
    // ignore: use_build_context_synchronously
    await StoriesServices.uploadstories(context: context, url: url!);
    setState(() {
      uploading = false;
    });
    getstories();
    setState(() {
      loded=false;
    });
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
        loded
            ? Scaffold(
                backgroundColor: backgroundColortransperent,
                body: Column(
                  children: [
                    HeaderContent(
                      title: "Stories",
                      icon: Icon(null),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: mystories['data'].length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.black,
                              child: Center(
                                child: Image.network(
                                  mystories['data'][index]['imageUrl'],
                                  height: height / 4,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: () {
                  !uploading?  showDialog(
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
                                      uploadstorie(ImageSource.gallery);
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
                                      uploadstorie(ImageSource.camera);
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
                        }):Container();
                  },
                  child:!uploading? Icon(Icons.add, color: golden):Constants.mycircularProgressIndicator(),
                ),
              )
            : Constants.mycircularProgressIndicator()
      ],
    ));
  }
}
