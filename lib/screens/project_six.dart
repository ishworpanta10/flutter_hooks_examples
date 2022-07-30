import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProjectSix extends HookWidget {
  const ProjectSix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotate image with useStreamController'),
      ),
      body: const Center(
        child: Text('Project Six'),
      ),
    );
  }
}
