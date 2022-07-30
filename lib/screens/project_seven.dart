import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const url = 'https://bit.ly/3x7J5Qt';

enum Action { rotateLeft, rotateRight, moreVisible, lessVisible }

@immutable
class State {
  final double rotationDegree;
  final double alpha;

  const State({
    required this.rotationDegree,
    required this.alpha,
  });
  const State.zero()
      : rotationDegree = 0.0,
        alpha = 1.0;

  State rotateRight() => State(rotationDegree: rotationDegree + 10, alpha: alpha);
  State rotateLeft() => State(rotationDegree: rotationDegree - 10, alpha: alpha);
  State increaseAlfa() => State(rotationDegree: rotationDegree, alpha: min(alpha + 0.1, 1.0));
  State decreaseAlfa() => State(rotationDegree: rotationDegree, alpha: max(alpha - 0.1, 0.0));
}

State reducer(State oldState, Action? action) {
  switch (action) {
    case Action.rotateLeft:
      return oldState.rotateLeft();
    case Action.rotateRight:
      return oldState.rotateRight();
    case Action.moreVisible:
      return oldState.increaseAlfa();
    case Action.lessVisible:
      return oldState.decreaseAlfa();
    case null:
      return oldState;
  }
}

class ProjectSeven extends HookWidget {
  const ProjectSeven({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = useReducer<State, Action?>(
      reducer,
      initialState: const State.zero(),
      initialAction: null,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reducer with Different Action'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {
                      store.dispatch(Action.rotateLeft);
                    },
                    child: const Text('Rotate Left'),
                  ),
                ),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {
                      store.dispatch(Action.rotateRight);
                    },
                    child: const Text('Rotate Right'),
                  ),
                ),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {
                      store.dispatch(Action.lessVisible);
                    },
                    child: const Text('- Alpha'),
                  ),
                ),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {
                      store.dispatch(Action.moreVisible);
                    },
                    child: const Text('+ Alpha'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
            Opacity(
              opacity: store.state.alpha,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(store.state.rotationDegree / 360.0),
                child: Image.network(url),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
