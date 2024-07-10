import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/layout/default_layout.dart';
import 'package:flutter_riverpod_example/riverpod/auto_dispose_modifier_provider.dart';

// Auto Dispose Modifier 실습

// ★ .autoDispose => 캐싱되던 다른 예제들과 달리 매번 새로 로딩디어 값이 새로 생성됨!
//                    즉, .autoDispose는 자동으로 삭제한다는 뜻!!!! (캐시를 삭제)
//                    그래서 필요없을 때 삭제하고, 필요할 때 생성함

// (1) StatelessWidget -> ConsumerWidget 으로 변경
// (2) build 함수에 WidgetRef ref 추가
class AutoDisposeModifierScreen extends ConsumerWidget {
  const AutoDisposeModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // (3)
    final state = ref.watch(autoDisposeModifierProvider);

    return DefaultLayout(
      title: 'AutoDisposeModifierScreen',
      body: Center(
        child:
            // (4)
            state.when(
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
