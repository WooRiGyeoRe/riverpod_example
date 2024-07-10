import 'package:flutter_riverpod/flutter_riverpod.dart';

// ProviderObserver 실습

class Logger extends ProviderObserver {
  // 오버라이드할 수 있는 값들 3가지 알아보자!
  // -------------------------------------------- didUpdateProvider / didAddProvider / didDisposeProvider
  // ProviderObserver를 extends한 무언가를 작성하면 이 3가지 사용이 가능해짐.
  // 이 값들을 가지고 상태들 안에 있는 값들을 모니터링, 로깅 등을 할 수 있게 된다.

  // (1) didUpdateProvider => 어떤 provider든 해당 class (여기선 Logger)가 포함된
  //                          provider Scope 안에서 사용되고 있는 어떤 provider든 업데이트 되면 이 함수가 실행됨.
  //    ProviderBase 타입의 provider는 그냥 provider임 (어떤 provider와 업데이트 됐는지!)
  //    previousValue는 기존 값 , newValue는 다음 값
  //    ProviderContainer는 provider를 담고있는 컨테이너랄까? (신경 안 써도 됨!)
  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    print('=====================');
    print(
        '[Provider Updated] provider : $provider / previousValue : $previousValue / newValue : $newValue');
    print('=====================');
  }

  // (2) didAddProvider => provider를 추가하면 불리는 함수
  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    print('=====================');
    print('[Provider Added] provider : $provider / value : $value ');
    print('=====================');
  }

  // (3) didDisposeProvider => provider가 삭제됐을 때 불리는 함수 (이 provider가 더 이상 화면에 필요 없어지면 삭제됨!)
  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    print('=====================');
    print('[Provider Disposed] provider : $provider');
    print('=====================');
  }
}
