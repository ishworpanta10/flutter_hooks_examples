import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProjectSeven extends HookWidget {
  const ProjectSeven({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Seven'),
      ),
      body: const Center(
        child: Text('Project Seven'),
      ),
    );
  }
}
