import 'package:flutter/material.dart';
import 'package:flutter_riverpod_example/layout/default_layout.dart';
import 'package:flutter_riverpod_example/screen/state_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // DefaultLayout 사용하려고 만들었으니까 DefaultLayout 리턴
    return DefaultLayout(
      title: 'HomeScreen',
      body: ListView(
        children: [
          // 이동 버튼
          ElevatedButton(
            // 이동을 위한 실질적 과정
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const StateProviderScreen(),
                ),
              );
            },
            child: const Text('StateProviderScreen'),
          ),
        ],
      ),
    );
  }
}
