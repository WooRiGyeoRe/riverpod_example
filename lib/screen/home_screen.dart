import 'package:flutter/material.dart';
import 'package:flutter_riverpod_example/layout/default_layout.dart';
import 'package:flutter_riverpod_example/screen/auto_dispose_modifier_screen.dart';
import 'package:flutter_riverpod_example/screen/family_modifier_screen.dart';
import 'package:flutter_riverpod_example/screen/future_provider_screen.dart';
import 'package:flutter_riverpod_example/screen/state_notifier_provider_screen.dart';
import 'package:flutter_riverpod_example/screen/state_provider_screen.dart';
import 'package:flutter_riverpod_example/screen/stream_provider_screen.dart';

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
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const StateNotifierProviderScreen(),
                ),
              );
            },
            child: const Text('StateNotifierProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const FutureProviderScreen(),
                ),
              );
            },
            child: const Text('FutureProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const StreamProviderScreen(),
                ),
              );
            },
            child: const Text('StreamProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const FamilyModifierScreen(),
                ),
              );
            },
            child: const Text('FamilyModifierScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const AutoDisposeModifierScreen(),
                ),
              );
            },
            child: const Text('AutoDisposeModifierScreen'),
          ),
        ],
      ),
    );
  }
}
