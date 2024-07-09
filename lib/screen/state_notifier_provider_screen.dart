import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/layout/default_layout.dart';
import 'package:flutter_riverpod_example/model/shopping_item_model.dart';
import 'package:flutter_riverpod_example/riverpod/state_notifier_provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ShoppingItemModel> state = ref.watch(shoppingListProvider);

    return DefaultLayout(
      title: 'StateNotifierProvider',
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
