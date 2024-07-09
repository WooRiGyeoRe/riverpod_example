/*

  ★ Flutter의 RiverPod이란?  => 상태 관리 라이브러리 중 하나로 Provider와 사용성은 같지만, 그 문제점을 개선한 버전!

  (플러터 RiverPod에 대해 이해하기 위해서는 기본적으로 Provider에 대한 이해가 선행되어야 함.)

  - 일반적인 Provider는 값을 읽을 수는 있지만, 수정할 순 없음! 
  - 값을 읽고 수정하려면 상태를 변경할 수 있는 Provider인 StateProvider를 사용해야 함. 
    일부 로직을 같이 사용하는 경우에는 StateNotifierProvider를 사용함. 
  
*/





// ★ provider 생성 방법 ★ ====================> 반드시 final 키워드 붙이기!!!
// Provider는 final 이므로 불변의 특징을 가짐!
// Provider => 모든 프로바이더 종류 중 하나로 기본이 되는 프로바이더
//             용도에 맞게 종류 선택해서 사용하면 됨!
// 어떠한 제한 없이 원하는데로 수 많은 종류의 프로바이더들을 선언할 수 있음.
// Provider는 다른 Provider를 포함할 수 있음.

// (1) final myProvider => 변수 선언! (추후 프로바이더의 상태를 읽기위해 사용)
// (2) ref 객체를 파라미터로 받음 => 다른 프로바이더들을 읽기 위해서 사용
//                                  프로바이더의 상태가 소멸될 때 일부 작업을 수행
// (3) 프로바이더가 동작하려면? 
//     => ProviderScope를 Flutter 앱의 가장 최상위(root) 부모 위젯으로 감싸줘야 함!


/*





final myProvider = Provider((ref) {
  return myValue();
});

*/

// ★ ref를 사용하여 Provider와 상호 작용하기 
// (1) ref.watch => provider의 값을 가져오고 변화를 모니터링.
//                  - 값이 변경되면 widget을 rebuild 하거나 값을 구독하고 있는 위치에 상태값을 전달 
//                  = 상태 변화 시 rebuild하기 때문에 성능 이슈가 발생할 수 있지만, 변화를 즉각 반영해야 할 때 사용  
// (2) ref.listen => watch와 동일하게 변화를 모니터링하나 widget을 rebuild하거나 다른 곳에 상태값을 전달하지 않음. 
//                   provider가 변경될 때마다 새 페이지로 이동하거나 모달을 표시하는 등의 커스텀한 작업을 수행할 수 있음.
// (3) ref.read => 변화를 모니터링하지 않으며, provider의 값을 가져옴.
//                 onClick과 같은 클릭 이벤트에서 변경 내용을 무시하면서 provider의 값이 필요할 때 유용함.



// ============================================================== main.dart


//import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';

// 공식 예제로 공부해보자!

// We create a "provider", which will store a value (here "Hello world").
// 해당 문장은 "프로바이더"라는 것을 생성하는 것으로 이 프로바이더는 값을 저정한다(여기서는 "Hello world"라는 값)
// By using a provider, this allows us to mock/override the value exposed.
// 프로바이더를 사용함으로써, 노출된 값을 모의하거나 재정의할 수 있다.

/* final helloWorldProvider = Provider((_) => 'Hello world'); */
// dart에서는 매개변수에 들어온 변수를 사용하지 않을 시,  _ 사용 가능

// Provider가 가지고 있는 매개변수=> '스토어'라고 함
// ((_) => 'Hello world') 얘가 바로 스토어...!
// 스토어에는 상태가 저장되고, 이러한 스토어를 Provider로 관리하는 패턴을 Provider패턴이라고 함!

/* void main() {
  runApp(  */
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // 위젯이 공급자를 읽을 수 있도록 하려면 전체를 포장해야 한다.
    // This is where the state of our providers will be stored.
    // ProviderScope" 위젯 안에 우리의 프로바이더들의 상태가 저장된다.

    // ★★★ ProviderScope ======> Provider를 제공할 범위를 지정!!!!
    // 이를 통해 Provider 객체들의 상태를 전역적으로 관리하고 생성함
   /*  const ProviderScope(
      child: MyApp(),
    ),
  );
} 
 */

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
// ★ StatelessWidget => ConsumerWidget
// ★ StatefulWidget => ConsumerStatefulWidget

// ★★★ ConsumerWidget => 상태를 구독하기 위해 ConsumerWidget을 상속한 클래스.
//                         ConsumerWidget는 Provider 객체의 상태를 구독하고,
//                         상태 변경이 있을 때마다 build를 호출해 화면을 다시 그림!
/* class MyApp extends ConsumerWidget {
  const MyApp({super.key});
   */

// ★★★ WidgetRef => 위젯 트리 내 Provider 객체에 대한 참조를 제공하고,
//                     이를 통해 하위 위젯에서 Provider 객체를 생성하거나 액세스 할 수 있음.

// Provider 객체에 액세스하여 상태변경을 감지하면 현재 위젯에 다시 빌드를 요청함.
// 또한 WidgetRef는 context와 같은 역할을 해서 다른 위젯에서도 상태를 공유하는 역할을 함.
// 이를 통해 상태 관리를 보다 효율적으로 할 수 있음!
  /* @override
  Widget build(BuildContext context, WidgetRef ref) {
     ★★★ ref => 다른 프로바이더 객체 얻기
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
 */