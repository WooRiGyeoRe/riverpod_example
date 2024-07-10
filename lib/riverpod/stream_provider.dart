// Stream Provider 실습

import 'package:flutter_riverpod/flutter_riverpod.dart';

// stream 은 async* 사용
final multipleStreamProvider = StreamProvider<List<int>>((ref) async* {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    // length는 3개 만들건데, 각각 인덱스별로 i랑 곱한 값 만들어볼 거임
    yield List.generate(3, (index) => index * i);
  }
});
