import 'package:app_anotacoes/app/business_logic/stores/text/text_store.dart';
import 'package:app_anotacoes/app/core/constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
  group('[TextStore]', () {
    final preferencesHelper = PreferencesHelperMock();
    late TextStore textStore;
    const newText = 'Olá mundo';

    setUp(() {
      textStore = TextStore(preferencesHelper);
    });

    test('Deve carregar lista', () {
      const mockList = ['A', 'B', 'C'];

      when(() => preferencesHelper.getStringList(Constants.textsList))
          .thenReturn(mockList);

      textStore.loadList();

      expect(textStore.texts, equals(mockList));
      expect(textStore.texts.first, equals(mockList.first));
      expect(textStore.texts.last, equals(mockList.last));
    });

    test('Deve adicionar um text', () {
      const newText = 'Olá mundo';

      when(() => preferencesHelper.setStringList(Constants.textsList, any()))
          .thenAnswer((_) => Future.value(true));

      textStore.addText(newText);

      expect(textStore.texts, isNotEmpty);
      expect(textStore.texts.first, equals(newText));
    });

    test('Deve adicionar um texto', () {
      when(() => preferencesHelper.setStringList(Constants.textsList, any()))
          .thenAnswer((_) => Future.value(true));

      textStore.addText(newText);

      expect(textStore.texts, isNotEmpty);
      expect(textStore.texts.first, equals(newText));
    });

    test('Não deve adicionar texto repetido', () {
      when(() => preferencesHelper.setStringList(Constants.textsList, any()))
          .thenAnswer((_) => Future.value(true));

      textStore.addText(newText);
      textStore.addText(newText);

      expect(textStore.texts.length, equals(1));
    });

    test('Deve editar texto', () {
      when(() => preferencesHelper.setStringList(Constants.textsList, any()))
          .thenAnswer((_) => Future.value(true));

      textStore.addText(newText);
      textStore.editText(newText, 'Teste');

      expect(textStore.texts.length, equals(1));
      expect(textStore.texts.first, equals('Teste'));
    });

    test('Deve deletar texto', () {
      when(() => preferencesHelper.setStringList(Constants.textsList, any()))
          .thenAnswer((_) => Future.value(true));
      const textTwo = 'Olá mundo 2';

      textStore.addText(newText);
      textStore.addText(textTwo);
      textStore.deleteText(newText);

      expect(textStore.texts.length, equals(1));
      expect(textStore.texts.first, equals(textTwo));
    });
  });
}
