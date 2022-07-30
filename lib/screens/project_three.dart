import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProjectThree extends HookWidget {
  const ProjectThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Three'),
      ),
      body: const Center(
        child: Text('Project Three'),
      ),
    );
  }
}
