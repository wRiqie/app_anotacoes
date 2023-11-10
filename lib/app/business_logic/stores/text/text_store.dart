import 'package:app_anotacoes/app/core/constants.dart';
import 'package:app_anotacoes/app/core/extensions.dart';
import 'package:app_anotacoes/app/core/helpers/preferences_helper.dart';
import 'package:mobx/mobx.dart';

part 'text_store.g.dart';

class TextStore = _TextStore with _$TextStore;

abstract class _TextStore with Store {
  final PreferencesHelper _preferencesHelper;

  _TextStore(this._preferencesHelper);

  @observable
  List<String> texts = [];

  @action
  void loadList() {
    texts = _preferencesHelper.getStringList(Constants.textsList);
  }

  @action
  Future addText(String text) async {
    if (texts.firstWhereOrNull((e) => e == text) != null) return;
    texts.add(text);
    _preferencesHelper.setStringList(Constants.textsList, texts);
  }

  @action
  Future editText(String oldText, String newText) async {
    var index = texts.indexOf(oldText);
    texts.setAll(index, [newText]);
    _preferencesHelper.setStringList(Constants.textsList, texts);
    loadList();
  }

  @action
  Future deleteText(String text) async {
    texts.removeWhere((e) => e == text);
    _preferencesHelper.setStringList(Constants.textsList, texts);
    loadList();
  }
}
