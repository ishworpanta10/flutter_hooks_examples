import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProjectEight extends HookWidget {
  const ProjectEight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Eight'),
      ),
      body: const Center(
        child: Text('Project Eight'),
      ),
    );
  }
}
