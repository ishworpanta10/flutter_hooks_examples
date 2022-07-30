import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

///creating extension CompactMap which return iterable List of value containing null on them
/// CompactMap<T> returns some sort of generic value of not nullable
/// on Iterable<T?> => whose elements  are optional values of T (can be null)
extension CompactMap<T> on Iterable<T?> {
  /// Iterable<T> => that returns Iterable of type T
  /// compactMap<E> => values going through this compact map are of instance of Type E as Elements
  /// ([]) => optional function that element E can call on this iterable and result can be optional value of E
  Iterable<T> compactMap<E>([E? Function(T?)? transform]) => map(transform ?? (e) => e).where((e) => e != null).cast();
}

//E.g
// final values = [1, 2, null, 3];
// final nonNullValue = values.compactMap((e) {
//   if (e != null && e > 2) {
//     return e;
//   } else {
//     return null;
//   }
// });

const url = 'https://bit.ly/3qYOtDm';

class ProjectThree extends HookWidget {
  const ProjectThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // this future does not persist the future in memory, so flickering screen because this rebuild widgets
    // so we have to memoized it
    // useMemoized create caching mechanism for complex object
    final future = useMemoized(() {
      return NetworkAssetBundle(Uri.parse(url))
          .load(url)
          .then((data) => data.buffer.asUint8List())
          .then((data) => Image.memory(data));
    });
    final snapshot = useFuture(future);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Three'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [snapshot.hasData ? snapshot.data! : const CircularProgressIndicator()].compactMap().toList(),
        ),
      ),
    );
  }
}
