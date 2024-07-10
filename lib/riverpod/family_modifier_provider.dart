import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/screen/family_modifier_screen.dart';

// Family Modifier => 어떤 값이든 상관 X
//                    어떤 provider든 다 똑같이 쓸 수 있음
//                    근데 여기서는 future Provider를 예제로 들어보겠음

// ★ Modifier는 Provider라고 쓴 Provider 글자 옆에 . 하고 무언가를 추가할 수 있음!!!!
// ★ family Modifier ====> Provider 생성할 때, 생성하는 순간에 우리가 어떤 변수를 입력해줘서
//                          이 변수로 Provider 안의 로직을 변경해야할 때 사용

// (1) .family => 에러 발생 => 이유는?
//                             family 넣는 순간 2번째 파라미터를 받게 되기 때문...
//                          => 해결 방법은?
//                             (ref)에 2번째 파라미터 추가해주기 (나는 data로 넣어보겠음!)
//                             <제너릭>에도 2번째 파라미터 넣어주기 (나는 int로 넣어주겠음!)
//
// (2) .autoDispose

// int 값으로 data를 받는다고 가정
final familyModifierProvider =
    FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(
    const Duration(seconds: 2),
  );

  return List.generate(
      5, (index) => index * data); // 이걸 어떻게 쓸 건지는 familyModifierScreen에서~~
  // return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
});
