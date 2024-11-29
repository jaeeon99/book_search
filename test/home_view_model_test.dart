import 'package:flitter_book_search_app/UI/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('HomeViewModel test', () async {
    //
    // 앱 내에서는 ProviderScope 안에서 뷰 모델을 관리
    // 텍스트 환경에서 Widget 을 생성하지 않고 테스트 할 수 있게 ProviderContainer 제공

    final providercontainer = ProviderContainer();
    addTearDown(providercontainer.dispose);
    final homeVm = providercontainer.read(homeViewModelProvider.notifier);
    // 처음 HomeViewModel의 상태 => 빈 리스트 인걸 테스트
    final firstState = providercontainer.read(homeViewModelProvider);
    expect(firstState.books.isEmpty, true);

    // HomeViewModer 에서  SearchBooks 메서드 호출 후 상태가 변경이 정상적으로 되는 지 테스트
    await homeVm.searchBooks('harry');
    final afterState = providercontainer.read(homeViewModelProvider);
    expect(afterState.books.isEmpty, false);

    afterState.books.forEach(
      (element) {
        print(element.toJson());
      },
    );
  });
}
