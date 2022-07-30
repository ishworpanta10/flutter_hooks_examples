import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProjectTwo extends HookWidget {
  const ProjectTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Hook Demo'),
      ),
      body: const Center(
        child: Text('Project Two'),
      ),
    );
  }
}
