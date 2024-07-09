// (api 연동 가정하고) async 요청해보기
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 예제에서는 List로 된 int를 리턴해 볼거임
final multiplesFutureProvider = FutureProvider<List<int>>((ref) async {
  // 2초 동안 비동기로(async) 기다리기
  await Future.delayed(
    const Duration(seconds: 2),
  );

  // (일부러 에러 내 보기)
  // 그럼 화면에 return [1, 2, 3, 4, 5] 리턴 값 안 보이고 Exception : ERROR 문구 뜸
  // 왜? => error가 발생했을 때, Text(err.toString()) 이 에러값을 Text에 넣으라고 했으니까.
  // throw Exception('ERROR');

  // 반환 (◈)
  return [1, 2, 3, 4, 5];
});
