import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultLayout extends StatelessWidget {
  // 3가지 파라미터를 받아오자
  final String title;
  final Widget body;
  final List<Widget>? actions;

  const DefaultLayout({
    super.key,
    required this.title,
    required this.body,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    // Scaffold => 레이아웃으로 쓸 때 가장 높은 곳에 있는 거
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions),
      body: Padding(
        // 패딩 좌우로 넣기
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
        child: body,
      ),
    );
  }
}
