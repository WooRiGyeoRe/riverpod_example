import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/model/shopping_item_model.dart';

// ★ StateNotifierProvider 실습

// StateNotifierProvider와 StateNotifier의 상관관계
// -> StateNotifier에 Provider만 붙어있음.
//    그래서 StateNotifier는 StateNotifierProvider 안에 제공될 class가 상속하는 것이고,
//    StateNotifierProvider는 이 값을 상속한 class를 Provider로 만들 수 있는 클래스임.

// ● (여기)
// <어떤 Notifier인지, 그 Notifier가 관리하는 state의 타입>
// (ref) => ShoppingListNotifier() => 관리할 class를 인스턴스로 만들어주기.
final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
  (ref) => ShoppingListNotifier(),
);

// ★ StateNotifierProvider를 사용할 땐?? ★
// (1) class 선언을 해 줘야 함!
// (2) StateNotifier 절대적으로 상속해줘야 함!
// (3) 그리고 이 StateNotifier는 상태 관리할 타입이 어떤 타입인지 지정해줘야 함!
//              ----> ShoppingItemModel을 List로 관리 = ShoppingListNotifier에서 ShoppingItemModel을 여러 개 관리하겠다는 뜻
// (4) 생성자를 하나 선언해줘야 함!
class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  // super 값에 처음에 어떤 값으로 상태를 초기화할지 넣어줘야 함.
  // ★ 타입 동일하게!!!
  // <List<ShoppingItemModel>>으로 관리하겠다고 했으니까 super([]) 이렇게 [] 리스트로 ~
  ShoppingListNotifier()
      : super(
          // 이 super 안에 들어가는 것들은 ShoppingListNotifier 상태를 초기화하는 값이 들어감.
          // 그리고 실제 StateNotifier 안에 선언한 ShoppingItemModel을 [List]로 집어 넣음.
          [
            ShoppingItemModel(
              name: '김치',
              quantity: 3,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '라면',
              quantity: 5,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '삼겹살',
              quantity: 10,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '수박',
              quantity: 2,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '카스테라',
              quantity: 5,
              hasBought: false,
              isSpicy: false,
            ),
          ],
        );

  // 메소드 하나 만들기! -> 아무 것도 return 안하니까 void로 (단순 변경만 할겨~!)
  // (상태를 변경하는 함수임!)
  // required String name = 쇼핑 아이템 이름 ---> 어떤 쇼핑 아이템을 토글하고싶은지 받을 거임
  void toggleHasBought({required String name}) {
    // state 변수 => extends한 StateNotifier에서 자동으로 제공되는 값
    //              그리고 이 값은 무조건!!!  super constructor에 들어가는
    //              파라미터 첫번째 파라미터 값으로 무조건 초기화 됨!

    // 입력한 name 값과 똑같은 ShoppingItemModel이 나오면 hasBought을 반대값으로 변경해보자.
    state = state
        .map((e) => e.name == name
            ?
            // name이 똑같을 때
            ShoppingItemModel(
                name: e.name,
                quantity: e.quantity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy)
            // 만약 다를 때 -> 똑같이 e 반환
            : e)
        .toList();
  } // ★ 여기서 중요한 것!!! => 완전히 새로은 List를 반환하고 있다는 것!!! ★ (map을 하면 항상 새로운 값을 반환함!)

  // 자! 그럼 이렇게 작성만 하면 될까?
  // 노노~ 쓰려면 어떻게 해야 할까? ----> 이걸 또 Provider로 만들어줘야 함! (● 위로 올라가셈!)
}
