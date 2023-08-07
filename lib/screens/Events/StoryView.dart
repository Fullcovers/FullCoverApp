import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:story_view/story_view.dart';

class Storypage extends StatefulWidget {
  const Storypage({super.key});

  @override
  State<Storypage> createState() => _StorypageState();
}

class _StorypageState extends State<Storypage> {
  @override
  Widget build(BuildContext context) {
    final StoryController controller = StoryController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Story View example"),
      ),
      body: Container(
        margin: EdgeInsets.all(
          8,
        ),
        child: ListView(
          children: <Widget>[
            Container(
              height: 300,
              child: StoryView(
                controller: controller,
                storyItems: [
                  StoryItem.text(
                    title:
                        "Hello world!\nHave a look at some great packages of flutter. \n\nTap!",
                    backgroundColor: Colors.orange,
                    roundedTop: false,
                  ),
                  StoryItem.inlineImage(
                    url:
                        "https://i.pinimg.com/originals/81/5d/89/815d895b4721c14cbe7c86c63806d6c8.gif",
                    controller: controller,
                    caption: Text(
                      "Rock Concert; You will love this show if taken as supper.",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  StoryItem.inlineImage(
                    url:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRRtnKMaJELWjO00mgYXttUMe1UfRJSnDxodA&usqp=CAU",
                    controller: controller,
                    caption: Text(
                      "My welcome Chatbot .........!",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  )
                ],
                onStoryShow: (s) {
                  print("Showing a story");
                },
                onComplete: () {
                  print("Completed a cycle");
                },
                progressPosition: ProgressPosition.bottom,
                repeat: false,
                inline: true,
              ),
            ),
            Material(
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => MoreStories()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(8))),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "View more stories",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreStories extends StatefulWidget {
  MoreStories({super.key, required this.stories});
  List<StoryItem> stories;
  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < widget.stories.length; i++) {}
    return Scaffold(
      body: StoryView(
        storyItems: widget.stories,
        // storyItems: [
        //   StoryItem.text(
        //     title: "I guess you'd love to see more of our food. That's great.",
        //     backgroundColor: Colors.blue,
        //   ),
        //   StoryItem.text(
        //     title: "Nice!\n\nTap to continue.",
        //     backgroundColor: Colors.red,
        //     textStyle: TextStyle(
        //       fontFamily: 'Dancing',
        //       fontSize: 40,
        //     ),
        //   ),
        //   StoryItem.pageImage(
        //     url:
        //         "https://plus.unsplash.com/premium_photo-1683134569393-69658335de74?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
        //     caption: "Still sampling",
        //     controller: storyController,
        //   ),
        //   StoryItem.pageImage(
        //       url:
        //           "https://images.unsplash.com/photo-1630395822970-acd6a691d97e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
        //       caption: "Working with gifs",
        //       controller: storyController),
        //   StoryItem.pageVideo(
        //     "https://samplelib.com/lib/preview/mp4/sample-5s.mp4",
        //     caption: "Hello, from the other side",
        //     controller: storyController,
        //   ),
        //   StoryItem.pageImage(
        //     url:
        //         "https://i.pinimg.com/originals/81/5d/89/815d895b4721c14cbe7c86c63806d6c8.gif",
        //     caption: "Hello, from the other side2",
        //     controller: storyController,
        //   ),
        // ],
        progressPosition: ProgressPosition.top,
        repeat: true,
        controller: storyController,
      ),
    );
  }
}
