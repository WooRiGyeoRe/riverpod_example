import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/screen/home_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomeScreen(),
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
