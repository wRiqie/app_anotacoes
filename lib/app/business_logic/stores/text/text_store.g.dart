// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TextStore on _TextStore, Store {
  late final _$textsAtom = Atom(name: '_TextStore.texts', context: context);

  @override
  List<String> get texts {
    _$textsAtom.reportRead();
    return super.texts;
  }

  @override
  set texts(List<String> value) {
    _$textsAtom.reportWrite(value, super.texts, () {
      super.texts = value;
    });
  }

  late final _$addTextAsyncAction =
      AsyncAction('_TextStore.addText', context: context);

  @override
  Future<dynamic> addText(String text) {
    return _$addTextAsyncAction.run(() => super.addText(text));
  }

  late final _$editTextAsyncAction =
      AsyncAction('_TextStore.editText', context: context);

  @override
  Future<dynamic> editText(String oldText, String newText) {
    return _$editTextAsyncAction.run(() => super.editText(oldText, newText));
  }

  late final _$deleteTextAsyncAction =
      AsyncAction('_TextStore.deleteText', context: context);

  @override
  Future<dynamic> deleteText(String text) {
    return _$deleteTextAsyncAction.run(() => super.deleteText(text));
  }

  late final _$_TextStoreActionController =
      ActionController(name: '_TextStore', context: context);

  @override
  void loadList() {
    final _$actionInfo =
        _$_TextStoreActionController.startAction(name: '_TextStore.loadList');
    try {
      return super.loadList();
    } finally {
      _$_TextStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
texts: ${texts}
    ''';
  }
}
