import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/riverpod/provider_observer.dart';
import 'package:flutter_riverpod_example/screen/home_screen.dart';

// ★ RiverPod 사용을 위해 ProviderScope로 감싸주기 ★
// ProviderScope가 상위에 있어야 상태관리 툴 사용이 가능하다.
void main() {
  runApp(
    ProviderScope(
      observers: [
        // Logger()를 넣으면 ProviderScope 안에 있는 (하위에 있는) 모든 provider들이
        // 업데이트 됐을 때 무조건 didUpdateProvider 코드가 불림.
        Logger(),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}



// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const ProviderScope(
//       child: MaterialApp(
//         title: 'Riverpod Counter',
//         home: CounterPage(),
//       ),
//     );
//   }
// }
