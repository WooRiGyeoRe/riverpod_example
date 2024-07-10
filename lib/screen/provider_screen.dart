import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/layout/default_layout.dart';
import 'package:flutter_riverpod_example/riverpod/provider.dart';
import 'package:flutter_riverpod_example/riverpod/state_notifier_provider.dart';

// Provider 안에 Provider 사용해보는 예제

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 프로바이더 사용

    final state = ref.watch(filteredShoppingListProvider);
    print("================");
    print(state);
    print("================");

    return DefaultLayout(
      title: 'ProviderScreen',
      actions: [
        PopupMenuButton<FilterState>(
          itemBuilder: (_) => FilterState.values
              .map(
                (e) => PopupMenuItem(
                  value: e,
                  child: Text(
                    e.name,
                  ),
                ),
              )
              .toList(),
          onSelected: (value) {
            // ref.read(filteredShoppingListProvider); => 내가 작성했던 코드
            // 하지만... 값을 변경해야 하기 때문에
            ref.read(filterProvider.notifier).update((state) => value);
          },
        ),
      ],
      body: ListView(
        children: state
            .map(
              (e) => CheckboxListTile(
                // title = name (쇼핑 아이템 이름)
                title: Text(e.name),
                // value = 체크박스 값 (true가 반환됨 -> 그래서 산 상태가 아니라면 체크가 안 되어 있음)
                value: e.hasBought,
                // onChanged => 체크박스 토글 기능
                // .notifier를 해주면 클래스가 그대로 옴(.toggleHasBought가 정의된 클래스)
                onChanged: (value) {
                  ref
                      .read(shoppingListProvider.notifier)
                      .toggleHasBought(name: e.name);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
