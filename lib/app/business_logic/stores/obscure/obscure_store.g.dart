// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'obscure_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ObscureStore on _ObscureStore, Store {
  late final _$isObscuredAtom =
      Atom(name: '_ObscureStore.isObscured', context: context);

  @override
  bool get isObscured {
    _$isObscuredAtom.reportRead();
    return super.isObscured;
  }

  @override
  set isObscured(bool value) {
    _$isObscuredAtom.reportWrite(value, super.isObscured, () {
      super.isObscured = value;
    });
  }

  late final _$_ObscureStoreActionController =
      ActionController(name: '_ObscureStore', context: context);

  @override
  void toggleIsObscured() {
    final _$actionInfo = _$_ObscureStoreActionController.startAction(
        name: '_ObscureStore.toggleIsObscured');
    try {
      return super.toggleIsObscured();
    } finally {
      _$_ObscureStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isObscured: ${isObscured}
    ''';
  }
}
