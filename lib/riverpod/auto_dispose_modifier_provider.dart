import 'package:flutter_riverpod/flutter_riverpod.dart';

// 여기에서도 future Provider 사용해볼거임!

// ★ .autoDispose
// - 새로운 값을 받거나 하지 않음! 알아서 자동으로 삭제함

// 일단 원래대로 <List<int>>로 넣어보겠음
// .autoDispose를 빼고 생각하면 사실 이건 일반적인 FutureProvider임!
// 그렇다면 .autoDispose가 들어갔을 때 어떻게 될까? ---> AutoDisposeModifierProvider class로 가서... 써보자!
final autoDisposeModifierProvider =
    FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(
    const Duration(seconds: 2),
  );
  return [1, 2, 3, 4, 5, 6];
});
