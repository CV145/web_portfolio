import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:html' as html;

import 'constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(super.key),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(Key? key) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  String reason = '';
  final CarouselController controller = CarouselController();

  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    setState(() {
      reason = changeReason.toString();
    });
  }

    final List<Widget> projectCards = [
      const ProjectCard(
        title: "BefriendED",
        description:
        'Contributing to a cross platform app that builds a community for people with\n'
        'eating disorders. Wrote a notification scheduler that delivers Android app\n'
        'notifications at a given time and weekday. Hosted the web app on Github\n'
        'pages. Added user account authentication using Firebase. Built a real-time\n'
        'chat server backend + scheduling system with ASP.NET Core SignalR.'
      ),
      const ProjectCard(
        title: "Rogue Gears",
        description:
        'Game and Simulation group project at Richland College. I \n'
        'took the initiative to lead the design and programming for the team. \n'
        'The game was made in Unreal Engine and we used blueprints which is a \n'
        'visual representation of C++ and OOP principles.'
      ),
      const ProjectCard(
        title: "Robobomb",
        description:
        'A personal project that introduced me to programming in general. I used\n'
        'Unity C# to make score counters, save the data as a file on a phone, and\n'
        'spawn different enemies using a random timer. I made all the pixel art \n'
        'myself and uploaded the final project as an Android app on Google Play.'
      ),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: CarouselSlider(
                items: projectCards,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  //aspectRatio: 16 / 9,
                  onPageChanged: onPageChange,
                  autoPlay: false,
                  enableInfiniteScroll: false,
                ),
                carouselController: controller,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ...Iterable<int>.generate(projectCards.length).map(
                      (int pageIndex) => Flexible(
                    child: ElevatedButton(
                      onPressed: () => controller.animateToPage(pageIndex),
                      child: Text("${pageIndex+1}"),
                    ),
                  ),
                ),
              ],
            ),
            buildFooter(context),
          ],
        ),
    );
  }

  Widget buildFooter(BuildContext context) {
    return Column(
      children: <Widget>[
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: buildSocialIcons(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSocialIcons() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            html.window
                .open("https://www.linkedin.com/in/carlos-valeriano-006506195/", "LinkedIn");
          },
          child: Image.network(
            Assets.linkedin,
            color: const Color(0xFF45405B),
            height: 20.0,
            width: 20.0,
          ),
        ),
        const SizedBox(width: 16.0),
        GestureDetector(
          onTap: () {
            html.window.open("https://www.instagram.com/codeberget/?hl=en", "Instagram");
          },
          child: Image.network(
            Assets.instagram,
            color: const Color(0xFF45405B),
            height: 25.0,
            width: 25.0,
          ),
        ),
        const SizedBox(width: 16.0),
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final Image? image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 1000,
        //height: 500,
        child: Card(
          elevation: 9.0,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: 250,
                  height: 250,
                  child: image,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                ElevatedButton(
                  child: const Text("View Project"),
                  onPressed: () => print("Button was tapped"),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

/*
Social Media Icon Attributions:
Image by <a href="https://www.freepik.com/free-vector/social-media-logo-collection_3899143.htm#query=social%20media%20icon&position=6&from_view=search&track=sph">Freepik</a>
 */