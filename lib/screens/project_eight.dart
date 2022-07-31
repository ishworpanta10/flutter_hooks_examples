import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProjectEight extends HookWidget {
  const ProjectEight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useAppLifecycleState();
    // print('State : $state');

    return Scaffold(
      appBar: AppBar(
        title: const Text('AppLifecycleState With useAppLifecycleState '),
      ),
      body: Center(
        child: Opacity(
          opacity: state == AppLifecycleState.resumed ? 1.0 : 0.0,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.grey.withAlpha(100),
                  spreadRadius: 10,
                )
              ],
            ),
            child: const FlutterLogo(size: 200),
          ),
        ),
      ),
    );
  }
}
