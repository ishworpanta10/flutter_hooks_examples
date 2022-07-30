import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProjectOne extends HookWidget {
  const ProjectOne({Key? key}) : super(key: key);

  Stream<String> getTime() => Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now().toIso8601String());

  @override
  Widget build(BuildContext context) {
    final time = useStream(
      getTime(),
      // initialData: 'Initial Stream Value'
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project One'),
      ),
      body: Center(
        child: !time.hasData ? const CircularProgressIndicator() : Text('Time : ${time.data}'),
      ),
    );
  }
}
