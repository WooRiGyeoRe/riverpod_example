import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 공식 예제로 공부해보자!

// We create a "provider", which will store a value (here "Hello world").
// 해당 문장은 "프로바이더"라는 것을 생성하는 것으로 이 프로바이더는 값을 저정한다(여기서는 "Hello world"라는 값)
// By using a provider, this allows us to mock/override the value exposed.
// 프로바이더를 사용함으로써, 노출된 값을 모의하거나 재정의할 수 있다.

final helloWorldProvider = Provider((_) => 'Hello world');
// dart에서는 매개변수에 들어온 변수를 사용하지 않을 시,  _ 사용 가능

// Provider가 가지고 있는 매개변수=> '스토어'라고 함
// ((_) => 'Hello world') 얘가 바로 스토어...!
// 스토어에는 상태가 저장되고, 이러한 스토어를 Provider로 관리하는 패턴을 Provider패턴이라고 함!

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // 위젯이 공급자를 읽을 수 있도록 하려면 전체를 포장해야 한다.
    // This is where the state of our providers will be stored.
    // ProviderScope" 위젯 안에 우리의 프로바이더들의 상태가 저장된다.

    // ★★★ ProviderScope ======> Provider를 제공할 범위를 지정!!!!
    // 이를 통해 Provider 객체들의 상태를 전역적으로 관리하고 생성함
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
// ★ StatelessWidget => ConsumerWidget
// ★ StatefulWidget => ConsumerStatefulWidget

// ★★★ ConsumerWidget => 상태를 구독하기 위해 ConsumerWidget을 상속한 클래스.
//                         ConsumerWidget는 Provider 객체의 상태를 구독하고,
//                         상태 변경이 있을 때마다 build를 호출해 화면을 다시 그림!
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

// ★★★ WidgetRef => 위젯 트리 내 Provider 객체에 대한 참조를 제공하고,
//                     이를 통해 하위 위젯에서 Provider 객체를 생성하거나 액세스 할 수 있음.

// Provider 객체에 액세스하여 상태변경을 감지하면 현재 위젯에 다시 빌드를 요청함.
// 또한 WidgetRef는 context와 같은 역할을 해서 다른 위젯에서도 상태를 공유하는 역할을 함.
// 이를 통해 상태 관리를 보다 효율적으로 할 수 있음!
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ★★★ ref => 다른 프로바이더 객체 얻기
    final String value = ref.watch(
        helloWorldProvider); // watch : Provider를 반복해서 관찰하고 상태가 변화면 build를 호출

    /* 
    Provider를 초기에 한 번만 읽고, 값이 변경되더라도 build를 요청하지 않음
    final String value = ref.read(helloWorldProvider); 
    */

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: Center(
          child: Text(value),
        ),
      ),
    );
  }
}
