// provider과 마찬가지로 riverpod도 codeGeneration하려면 .g.dart 파일 등록해야 함!!!
// 현재 파일 이름 + .g.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// codeGeneration 사용은 프로젝트 성향에 맞게 골라 사용하면 됨 (무조건 써야된다가 아님!)

// ★ codeGeneration
// 1) 어떤 Provider를 사용할지 결정할 고민할 필요가 없도록
//    Provider, FutureProvider, StreamProvider => codeGeneration을 이용하면 riverpod에서 자동으로 결정해 줌.
//    StateNotifierProvider는 명시적으로 codeGeneration 할 수 있음

// 일반적인 Provider 생성 방법
// String 값 반환
final _testProvider = Provider<String>((ref) => 'Hello Code Generation');

// 태그 작성하고, 일반 함수 작성하기
// 무조건 받아야하는 값 () 안에 작성 => 무조건 받아야하는 값은 위에 작성한 (ref)값!!
// (ref)값 작성은 어떻게 할까? => 현재 함수의 이름으로 (여기선 GState + Ref) 첫번째 글자만 대문자로 바꾸기!!!
// 그리고 터미널 창에 flutter pub run build_runner build 실행
@riverpod
String gState(GStateRef ref) {
  return 'Hello Code Generation';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(
    const Duration(seconds: 3),
  );
  return 10;
}

// Auto Dispose 안 쓰고 일반 provider 생성하고 싶을 때
// @ 대문자는 무조건 () 작성 => 그리고 무조건 파라미터 1개 받은
@Riverpod(
  // keepAlive => 살려둬라 (keepAlive 기본 값은 false)
  //              true로 작성하면 Auto Dispose가 안 걸린 provider를 만들 수 있음
  keepAlive: true,
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(
    const Duration(seconds: 3),
  );
  return 10;
}

// 2) Parameter를 일반 함수처럼 사용할 수 있도록
//    Parameter = 리버팟에서는 Family
// (A)
class Parameter {
  final int number1;
  final int number2;

  Parameter({
    required this.number1,
    required this.number2,
  });
}

final _testFmailyProvider = Provider.family<int, Parameter>(
    (ref, parameter) => parameter.number1 * parameter.number2);

// (A)와 (B)는 같은 방식임 근데 (B)가 더 간략함!

// (B)
@riverpod
int gStateMultiply(GStateMultiplyRef ref,
    // 파라미터 안에 값을 전달만 해 주면 일반 family를 사용하던 것처럼 riverpod 사용할 수 있음
    {required int number1,
    required int number2}) {
  return number1 * number2;
}

@riverpod
class GStateNotifier extends _$GStateNotifier {
  // 초기 상태 지정하기
  @override
  int build() {
    return (0);
  }

  increment() {
    state++;
  }

  decrement() {
    state--;
  }
} // 작성 후, 터미널에 flutter pub run build_runner build 해주기 
