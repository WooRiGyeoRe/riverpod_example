import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/layout/default_layout.dart';
import 'package:flutter_riverpod_example/riverpod/family_modifier_provider.dart';

// Family Modifier 실습

// StatelessWidget => ConsumerWidget 으로 변경하고 build 함수에도 추가
class FamilyModifierScreen extends ConsumerWidget {
  const FamilyModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 근데 final state = ref.watch(familyModifierProvider); 이렇게만 해도 원래 잘 됐는데 에러!
    // 왜냐면 .family 이것 때문에...
    // 그래서 ()로 생성을 한 번 해줘야 함! 그리고 () 이 안에 파라미터 넣어주면 됨!
    //                                   => .family를 넣게되면 data를 받겠다고 선언했으니까 data값에 해당되는 파라미터를 넣어주면 되겠지!?
    final state = ref.watch(familyModifierProvider(3));

    return DefaultLayout(
      title: 'FamilyModifierScreen',
      body: (Center(
        child:
            // state.when
            state.when(
          data: (data) => Text(
            data.toString(),
          ),
          error: (err, stack) => Text(
            err.toString(),
          ),
          loading: () => const CircularProgressIndicator(),
        ),
      )),
    );
  }
}
