import 'package:flutter/material.dart';
import 'package:flutter_hook_examples/screens/project_five.dart';
import 'package:flutter_hook_examples/screens/project_four.dart';
import 'package:flutter_hook_examples/screens/project_one.dart';
import 'package:flutter_hook_examples/screens/project_seven.dart';
import 'package:flutter_hook_examples/screens/project_six.dart';
import 'package:flutter_hook_examples/screens/project_three.dart';
import 'package:flutter_hook_examples/screens/project_two.dart';

import 'project_eight.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Hook Demo'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProjectOne(),
                ),
              );
            },
            child: const Text('Time with useStream'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProjectTwo(),
                ),
              );
            },
            child: const Text('Text Display with useEffect'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProjectThree(),
                ),
              );
            },
            child: const Text('Load Image with useFuture'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProjectFour(),
                ),
              );
            },
            child: const Text('Count Down with useListenable'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProjectFive(),
                ),
              );
            },
            child: const Text('Animation With useAnimationController'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProjectSix(),
                ),
              );
            },
            child: const Text('Rotate image with useStreamController'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProjectSeven(),
                ),
              );
            },
            child: const Text('Project Seven'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProjectEight(),
                ),
              );
            },
            child: const Text('Project Eight'),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
