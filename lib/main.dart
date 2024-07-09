import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/screen/home_screen.dart';

// ★ RiverPod 사용을 위해 ProviderScope로 감싸주기 ★
// ProviderScope가 상위에 있어야 상태관리 툴 사용이 가능하다.
void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
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
