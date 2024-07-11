import 'package:flutter_riverpod/flutter_riverpod.dart';

// 가장 기본이되는 Provider인 State 사용해보기

// 0은 내가 관리할 거라 <int>로 넣어주면 됨
final numberProvider = StateProvider<int>((ref) => 0);

final a = Provider((ref) => null);

final t = FutureProvider((ref) => null);

final testProvider = FutureProvider((ref) async {
  return;
});
