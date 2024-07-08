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
