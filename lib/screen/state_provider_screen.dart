import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/layout/default_layout.dart';
import 'package:flutter_riverpod_example/riverpod/state_provider_screen.dart';

// ★ StatelessWidget에서 ConsumerWidget으로 변경 ★ => 리버팟 사용 준비 완료!
class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  // 기존 StatelessWidget와 99% 유사한데, 1% 차이가 있음.
  // 뭘까?? => build(BuildContext context) 함수 안에 하나의 파라미터를 더 받음!
  //           그게 바로.... ★ WidgetRef ref ★
  //           이 ref를 사용해 RiverPod 안에 선언해 놓은 StateProvider에 접근할 수 있게 됨!
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref. 하면 read / watch / listen 나옴
    // ★ (1) ref.watch => 특정 프로바이더를 보고있다가 그 프로바이더가 변경되면 빌드 재실행
    //                  => 직접적으로 UI에 반영
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
      title: 'StateProviderScreen',
      body: SizedBox(
        // 너비 최대한으로 늘리기
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                // ★ (2) ref.read => 실행
                // .update((state) => )에서 (state)는 현재 상태를 의미 ---> 즉, 0
                ref.read(numberProvider.notifier).update((state) => state + 1);
              },
              child: const Text('UP'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const _NextScreen(),
                  ),
                );
              },
              child: const Text('NextScreen'),
            ),
          ],
        ),
      ),
    );
  }
}

// 여기서만 쓸 거니까 _ 언더스코어 달아서 클래스명 지어주기
// StatelessWidget => ConsumerWidget으로 변경
class _NextScreen extends ConsumerWidget {
  const _NextScreen({super.key});

  //  Widget build(BuildContext context) 함수 안에 WidgetRef ref 추가
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
      title: 'StateProviderScreen',
      body: SizedBox(
        // 너비 최대한으로 늘리기
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).update((state) => state + 1);
              },
              child: const Text('UP'),
            ),
          ],
        ),
      ),
    );
  }
}
