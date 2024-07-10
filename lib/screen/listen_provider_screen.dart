import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/layout/default_layout.dart';
import 'package:flutter_riverpod_example/riverpod/listen_provider.dart';

// ★ Listen => 무언가 값이 변경됐는데, 그 변경된 값에 의해
//	            우리가 어떤 함수를 또 실행하고 싶을 때 사용함!

// (특이점) - 보통의 Listen은 initState에서 일반적으로 사용했지만,
// 	          river pod의 Provider로 Listen할 경우엔 build 함수 안에서 바로 쓸 수 있음!!
//         - dispose를 따로 할 필요도 없음! 그냥 build 함수 안에서 listen을 해도 중복으로 절대 listen이 안 됨!
//            그래서 아무런 신경 쓰지 않고, initState에서 listen 해 놓은 것처럼 listen 하면 됨.

// StatefulWidget으로 만들어보자!!!
// ★ StatefulWidget 일땐?
//   (1) ConsumerStatefulWidget 으로 변경해주면 됨!
//   (2) State => ConsumerState 로 변경!!!
// ========================================== 이렇게 해 주면, StatefulWidget 기능을 유지한 채 Provider도 사용할 수 있는 위젯들을 만들 수 있음!
class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({super.key});

  @override
  ConsumerState<ListenProviderScreen> createState() =>
      _ListenProviderScreenState();
}

// ★ StatefulWidget 특이점!!!
//    StatelessWidget과 달리 build 함수 안에 2번째 파라미터를 받지 않음!!!
// (♣ 여기!!!!)
class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  // (3) 탭을 만들어보자~
  late final TabController controller;

  // (4) state랑 똑같으니까 당연히 init State 있겠지~?!
  // ★ initState()에서는 어떤 경우에서라도 ref.watch를 해선 안 됨!!!!!!! (단발적으로만 실행하기 때문에)
  @override
  void initState() {
    super.initState();

    // vsync는 this를 해줘야 하고, TickerProviderMixin 해줘야 함! (위에다 ♣)
    // initialIndex: ref.read(listenProvider) 추가해주면 뒤로 갔다 다시 돌아와도 마지막 번호로 다시 잘 나옴.
    controller = TabController(
      length: 10,
      vsync: this,
      initialIndex: ref.read(listenProvider),
    );
  }

  // StatefulWidget을 쓰면 context도 사실상 class _ListenProviderScreenState 안에서
  // 어디서든 글로벌하게 제공 됨 -> this.context 로 제공이 됨!
  // ref도 마찬가지...
  @override
  Widget build(BuildContext context) {
    //  ★ (5) ref.listen(provider, (previous, next) { });
    //            => (listen할 provider, (기존 state , 변경될 다음 state) { }); ★★
    //  <int> 이런 식으로 넣어주면 타입이 (previous, next)에서 반환되는지 지정할 수도 있음!
    ref.listen<int>(listenProvider, (previous, next) {
      // print(previous); // previous = 0
      // print(next); // previous 다음

      // 만약 previous가 next와 다르다면
      if (previous != next) {
        controller.animateTo(next);
      }
    });

    return DefaultLayout(
      title: 'ListenProviderScreen',
      // 탭 구현하기
      body: TabBarView(
        // TabBarView를 사용할 때는 TabController를 명시적으로 제공해야 함!!!
        controller: controller,
        // NeverScrollableScrollPhysics -> 좌우 스와이프 막기
        physics: const NeverScrollableScrollPhysics(),
        // 인덱스별로 그냥 인덱스 숫자만 보이게 생성해보자~~~
        // 10개 페이지 한 다음, 인덱스별로
        children: List.generate(
          10,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                index.toString(),
              ),
              ElevatedButton(
                // onPressed 안에 controller ~ (어쩌구) 작성해도 되지만,
                // 그렇게 하면 매번 상태를 바꾸면서 같이 controller 연동시켜야 하는 번거로움 ...
                // ------ 우리가 원하는 건? => 상태가 변경될 때마다 controller가 자동으로 탭을 변경해주는 거임!
                //                         => 그래서 listen을 통해 provider를 리스닝하면서 값이 변경될 때마다
                //                            상단에 Widget build 함수를 실행하게 하면, 변경된 값(previous, next)에 의해
                //                            controller를 실행(controller.animateTo(next)할 수 있음.
                //                            (값이 변경될 때마다 컨트롤러에 animateTo를 실행해 원하는 탭의 인덱스로 이동할 수 있게 되는 것!)
                onPressed: () {
                  // ★ (6)-1 onPressed에서는 ref.read 해서 실행해야 함!
                  //          무언가 행동한 다음 Provider 가져올 땐 무조건 read 함수 사용!!!!!!!
                  ref.read(listenProvider.notifier).update(
                      // state가 10이면... 즉, 최대 페이지까지 갔다면 그냥 10을 반환하고, 아니면 state + 1 반환
                      (state) => state == 10 ? 10 : state + 1);
                },
                child: const Text('NEXT'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(listenProvider.notifier)
                      .update((state) => state == 0 ? 0 : state - 1);
                },
                child: const Text('BACK'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
