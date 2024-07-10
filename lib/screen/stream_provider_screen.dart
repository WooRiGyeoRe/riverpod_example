import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/layout/default_layout.dart';
import 'package:flutter_riverpod_example/riverpod/stream_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

// 실행하면 로딩하고 1초마다 숫자 바뀜
// 왜? => watch를 통해 multipleStreamProvider에서 값이 바뀔 때마다
//        BuildContext 빌드 함수를 재실행해야 된다고 정의했기 때문에
//        계속 랜더링이 다시 되고, multipleStreamProvider가 실행이 되면서
//        그 안에 있는 코드가 실행이 되는 것((int i = 0; i < 10; i++) 어쩌구 저쩌구)

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multipleStreamProvider);

    return DefaultLayout(
      title: 'StreamProviderScreen',
      body: Center(
        child: state.when(
          data: (data) => Text(
            data.toString(),
          ),
          error: (err, stack) => Text(
            err.toString(),
          ),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
