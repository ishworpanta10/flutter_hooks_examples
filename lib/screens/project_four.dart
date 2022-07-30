import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CountDown extends ValueNotifier<int> {
  late StreamSubscription sub;
  CountDown({required int from}) : super(from) {
    sub = Stream.periodic(const Duration(seconds: 1), (tick) => from - tick)
        .takeWhile(
      (value) => value >= 0,
    )
        .listen(
      (value) {
        this.value = value;
      },
    );
  }
  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }
}

class ProjectFour extends HookWidget {
  const ProjectFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countDown = useMemoized(() => CountDown(from: 20));
    final listenable = useListenable(countDown);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Down with useListenable'),
      ),
      body: Center(
        child: Text(
          listenable.value.toString(),
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
