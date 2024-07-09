import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/layout/default_layout.dart';
import 'package:flutter_riverpod_example/riverpod/future_provider.dart';

// Future Provider 실습

// (1) future_provider.dart에 Provider 생성했으니까 StatelessWidget => ConsumerWidget으로 변경해주기
class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  // (2) 빌드 함수에 WidgetRef ref 파라미터 추가
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // (3) 감시해주기
    // multiplesFutureProvider에서 반환해준 값 받게 될 거임 (◈ 이게 반환 값)
    // (5) 그리고 상태는 ★ AsyncValue 상태 ★ 로 들어오게 됨------------------------->  ★ 그리고 AsyncValue에는 무조건 when 함수가 필요! ★
    //     final state = ref.watch(multiplesFutureProvider); 가 아니라
    //     final AsyncValue state = ref.watch(multiplesFutureProvider);
    final AsyncValue state = ref.watch(multiplesFutureProvider);

    return DefaultLayout(
      title: 'FutureProviderScreen',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // (4) 근데, 2초동안 비동기로 기다리는 시간이 있음 --> 이건 어떻게 처리될까?
          // data => 데이터 로딩이 끝나서 데이터가 있을 때 실행되는 함수
          // error => 에러났을 때 실행되는 함수
          // loading => 로딩이 되고 있을 때 실행되는 함수
          // =============================================== (multiplesFutureProvider)이 값을 ref.watch 하고 있다가
          //                                                   값이 반환되거나 상태가 변경되면 각 파라미터에 해당하는 (data/error/loading)
          //                                                   함수들이 실행되어서 위젯을 반환할 수 있게 되는 것임!
          // data => 반환 받은 multiplesFutureProvider 값... 즉 state (state = 으로 해서 담아줬으니까)
          // ================== .when 함수를 통해 각 파라미터의 함수 상태의 경우를 따로 named parameter로 함수를 써서 표현할 수 있음!
          state.when(
            data: (data) {
              return Text(
                data.toString(),
                textAlign: TextAlign.center,
              );
            },
            // 에러 내용, 스택 받을 수 있음
            // 에러 발생 시, Text 반환
            error: (err, stack) => Text(
              err.toString(),
            ),
            // 로딩 상태일 때 아무 것도 파라미터에 받지 않고, 그냥 CircularProgressIndicator
            // 뒤로 갔다가 다시 들어오면 캐싱됨(기억하고 있음 -> 그래서 다시 로딩 안 되고 바로 보이고 재시작하면 다시 로딩 나옴)
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
