import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

extension Normalize on num {
  num normalize({
    required num selfRangeMin,
    required num selfRangeMax,
    num normalizeRangeMin = 0.0,
    num normalizeRangeMax = 1.0,
  }) {
    // print('this:$this');
    return (normalizeRangeMax - normalizeRangeMin) * ((this - selfRangeMin) / (selfRangeMax - selfRangeMin)) + normalizeRangeMin;
  }
}

const url = 'https://bit.ly/3x7J5Qt';
const imageHeight = 300.0;

class ProjectFive extends HookWidget {
  const ProjectFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final opacity = useAnimationController(
      duration: const Duration(seconds: 1),
      initialValue: 1.0,
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    final size = useAnimationController(
      duration: const Duration(seconds: 1),
      initialValue: 1.0,
      lowerBound: 0.0,
      upperBound: 1.0,
    );

    final controller = useScrollController();

    useEffect(() {
      controller.addListener(() {
        // print('controller.offset : ${controller.offset}');
        final newOpacity = max(imageHeight - controller.offset, 0.0);
        final normalized = newOpacity.normalize(selfRangeMin: 0.0, selfRangeMax: imageHeight).toDouble();
        // print('normalized : $normalized');
        opacity.value = normalized;
        size.value = normalized;
      });
      return null;
    }, [controller]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Five'),
      ),
      body: Column(
        children: [
          SizeTransition(
            sizeFactor: size,
            axis: Axis.vertical,
            axisAlignment: -1.0,
            child: FadeTransition(
              opacity: opacity,
              child: Image.network(
                url,
                fit: BoxFit.cover,
                height: imageHeight,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: controller,
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Item ${index + 1}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
