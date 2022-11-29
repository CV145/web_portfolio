import 'package:flutter/material.dart';
import 'package:web_portfolio/stacked_card_carousel.dart';

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

class MyHomePage extends StatelessWidget {
  MyHomePage(Key? key) : super(key: key);

  final List<Widget> fancyCards = [
    const ProjectCard(
      title: "Say hello to planets!",
      description: 'Description!',
    ),
    const ProjectCard(
      title: "Don't be sad!",
      description: 'Description!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StackedCardCarousel(
        items: fancyCards,
      ),
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
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
              child: const Text("Learn more"),
              onPressed: () => print("Button was tapped"),
            ),
          ],
        ),
      ),
    );
  }
}