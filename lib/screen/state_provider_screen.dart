import 'package:flutter/material.dart';
import 'package:flutter_riverpod_example/layout/default_layout.dart';

class StateProviderScreen extends StatelessWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
        title: 'StateProviderScreen',
        body: Column(
          children: [],
        ));
  }
}
