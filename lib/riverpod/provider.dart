import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/riverpod/state_notifier_provider.dart';

// Provider 안에서 무언갈 쓸 때 watch를 주로 사용 (read 잘 사용 X)
// 왜? => watch하고 있는 provider가 변경되면 최상위 provider도 변경되어야 하므로...

final filteredShoppingListProvider = Provider<List>(
    // (ref) => ref.watch(shoppingListProvider),
    (ref) {
  final filterState = ref.watch(filterProvider);
  final ShoppingListState = ref.watch(shoppingListProvider);

  // 내가 원하는 것은 => notSpicy면 notSpicy만 보이게, spicy면 spicy만 보이게....
  // 필터링을 하고 싶음!
  if (filterState == FilterState.all) {
    return ShoppingListState;
  }
  // 그게 아닌 나머지 경우에는?
  // ★ .where을 사용해서 필터링!
  // filterState가 FilterState.spicy면 element.isSpicy만 return
  // 아니라면 !element.isSpicy을 return
  return ShoppingListState.where((element) =>
          filterState == FilterState.spicy ? element.isSpicy : !element.isSpicy)
      .toList();
});

// 코드를 해석해보면...
// filteredShoppingListProvider = Provider => filteredShoppingListProvider은 Provider임!
// 근데 ref.watch(shoppingListProvider) 이 안에서
// ref.watch를 통해 shoppingListProvider를 또 watch하고 있음!

// 그리고 ProviderScreen에서는 filteredShoppingListProvider를 watch하고 있음!

// action 을 위한 필터링 상태 지정하기
enum FilterState {
  // 안 매움
  notSpicy,
  // 매움
  spicy,
  // 전부
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
