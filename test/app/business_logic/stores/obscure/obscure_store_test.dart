import 'package:app_anotacoes/app/business_logic/stores/obscure/obscure_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('[ObscureStore]', () {
    late ObscureStore obscureStore;

    setUp(() {
      obscureStore = ObscureStore();
    });

    test('isObscured deve começar true', () {
      expect(obscureStore.isObscured, isTrue);
    });

    test('isObscured deve ficar false', () {
      obscureStore.toggleIsObscured();
      expect(obscureStore.isObscured, isFalse);
    });

    test('isObscured deve voltar a ser true', () {
      obscureStore.toggleIsObscured();
      obscureStore.restart();
      expect(obscureStore.isObscured, isTrue);
    });
  });
}
