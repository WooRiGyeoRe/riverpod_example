import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/model/shopping_item_model.dart';

// StateNotifierProvider 생성하려면? => class 선언!!!

// SelectNotifier 만들었으니까 이걸 Provider로 만들어보자
// <SelectNotifier, ShoppingItemModel> => <Notifier 타입 , Notifier에서 다루는 상태의 타입>
final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>(
  (ref) => SelectNotifier(),
);

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      : super(
          ShoppingItemModel(
              name: '김치', quantity: 3, hasBought: false, isSpicy: true),
        );

  toggleHasBought() {
    /*
    state = ShoppingItemModel(
        name: state.name,
        quantity: state.quantity,
        hasBought: !state.hasBought,
        isSpicy: state.isSpicy);
    */

    // copyWith 생성했으니 사용할 수 있게 됨~
    state = state.copyWith(hasBought: !state.hasBought);
  }

  toggleIsSpicy() {
    //const ts = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
    // copyWith
    // fontSize가 18이라는 게 선언된 게 아니라 ts에서 선언된 모든 값들에서
    // fontSize만 18로 변경되어 새로 선언된 것!
    // final ts2 = ts.copyWith(fontSize: 18);

    /*
    state = ShoppingItemModel(
        name: state.name,
        quantity: state.quantity,
        hasBought: state.hasBought,
        isSpicy: !state.isSpicy);
    */

    state = state.copyWith(isSpicy: !state.isSpicy);
  }
}
