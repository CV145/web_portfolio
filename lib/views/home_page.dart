import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/project_card.dart';
import 'dart:html' as html;



class MyHomePage extends StatefulWidget {
  const MyHomePage(Key? key) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  final CarouselController controller = CarouselController();
  int currentPageIndex = 0;
  final List<ProjectCard> projectCards = [
    const ProjectCard(
        title: "BefriendED",
        description:
            'Small cross platform app that schedules chats for people with '
            'eating disorders. Wrote a notification scheduler that delivers Android app'
            'notifications at a given time and weekday. Hosted the web app on Github'
            'pages. Added user account authentication using Firebase. Built a real-time'
            ' chat server backend + scheduling system with ASP.NET Core SignalR.'),
     ProjectCard(
        title: "Rogue Gears",
        image: Image.asset(
          'images/rogue3.png',
          width: 400,
          height: 800,
        ),
        description: 'Game and Simulation group project at Richland College. I '
            'took the initiative to lead the design and programming for the team.'
            'The game was made in Unreal Engine and we used blueprints which is a'
            'visual representation of C++ and OOP principles. Worked on the TopDown'
            ' game mode to tie the game systems together. Built player character '
            'switching and follow AI, and persisting game state between scenes.'),
    const ProjectCard(
        title: "Robobomb",
        description:
            'A personal project that introduced me to programming in general. I used'
            ' Unity C# to make score counters, save the data as a file on a phone, and'
            'spawn different enemies using a random timer. I made all the pixel art '
            'myself and uploaded the final project as an Android app on Google Play.'),
    const ProjectCard(
      title: 'Tactical Movement System',
      description: 'In this project I used breadth-first search and queues to '
        'implement a tactical movement system similar to chess. The game uses 2D '
        'tilemaps in Unity and touch controls to select "characters". Platform: Android',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          buildHeader(context),
          Expanded(
            child: CarouselSlider(
              items: projectCards,
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: false,
                  enableInfiniteScroll: false,
                  clipBehavior: Clip.hardEdge),
              carouselController: controller,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ...Iterable<int>.generate(projectCards.length).map(
                (int pageIndex) => Flexible(
                  child: ElevatedButton(
                    onPressed: () => controller.animateToPage(pageIndex),
                    child: Text(projectCards[pageIndex].title),
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

  Widget buildHeader(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [buildName(context), buildNavButtons(context)],
            )),
        const Divider(),
      ],
    );
  }

  Widget buildNavButtons(BuildContext context) {
    return Row(
      children: [
        TextButton(onPressed: () {}, child: const Text('ASP.NET Projects')),
        TextButton(onPressed: () {}, child: const Text('Unity Projects')),
        TextButton(onPressed: () {}, child: const Text('Skills & Experiences'))
      ],
    );
  }

  Widget buildName(BuildContext context) {
    return Row(
      children: [
        Text(
          'Carlos Valeriano',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          '   .NET Developer',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }

  Widget buildFooter(BuildContext context) {
    return Column(
      children: <Widget>[
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('(C) Carlos Valeriano 2022'),
              buildSocialIcons(),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSocialIcons() {
    return Row(
      mainAxisSize: MainAxisSize.max, //maximize free space
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          onPressed: () {
            html.window.open(
                "https://www.linkedin.com/in/carlos-valeriano-006506195/",
                "LinkedIn");
          },
          icon: Image.network(
            Assets.linkedin,
            color: const Color(0xFF000000),
            height: 20.0,
            width: 20.0,
          ),
        ),
        const SizedBox(width: 16.0),
        IconButton(
          onPressed: () {
            html.window.open(
                "https://www.instagram.com/codeberget/?hl=en", "Instagram");
          },
          icon: Image.network(
            Assets.instagram,
            color: const Color(0xFF000000),
            height: 25.0,
            width: 25.0,
          ),
        ),
        const SizedBox(width: 16.0),
      ],
    );
  }
}
