import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProjectFour extends HookWidget {
  const ProjectFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Four'),
      ),
      body: const Center(
        child: Text('Project Four'),
      ),
    );
  }
}
