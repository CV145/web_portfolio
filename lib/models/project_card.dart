import 'package:flutter/material.dart';

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
        child: Scrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0, bottom: 2.0, left: 35.0, right: 35.0),
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(25),
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: image,
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(25),
                  ),
                  ElevatedButton(
                    child: const Text("View Project"),
                    onPressed: () => print("Show project info here"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}