import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/layout/default_layout.dart';
import 'package:flutter_riverpod_example/riverpod/select_provider.dart';
import 'package:provider/provider.dart';

// SelectNotifier 실습

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');

    // ref.watch
    // final state = ref.watch(selectProvider);

    // hasBought 또는 isSpicy 중 1개만 궁금할 땐??? => .select 붙여주기
    // (value) = selectProvider의 상태
    // 그런데 이렇게만 하면 아마 아래 빨간줄로 에러날 거임...
    //  왜?
    //  => 이 state는 원래 ShoppingItemModel이었는데, 지금은 isSpicy 값만 따로 선택했기 때문에
    //     state는 이제 bool값임... 왜냐면 final bool isSpicy 이기 때문에 ~
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));

    ref.listen(selectProvider.select((value) => value.hasBought),
        (previous, next) {
      print('next : $next');
    });

    return DefaultLayout(
      title: 'SelectProviderScreen',
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*
            // 그럼 여기서 state. 했을 때 name을 넣어줄 수 있게 됨!
            Text(state.name),
            Text(
              state.hasBought.toString(),
            ),
            Text(
              state.isSpicy.toString(),
            ),*/
            Text(
              state.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleIsSpicy();
              },
              child: const Text('Spicy Toggle'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleHasBought();
              },
              child: const Text('HasBought Toggle'),
            ),
          ],
        ),
      ),
    );
  }
}
