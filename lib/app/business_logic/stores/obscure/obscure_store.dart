import 'package:mobx/mobx.dart';

part 'obscure_store.g.dart';

class ObscureStore = _ObscureStore with _$ObscureStore;

abstract class _ObscureStore with Store {
  @observable
  bool isObscured = true;

  void restart() {
    isObscured = true;
  }

  @action
  void toggleIsObscured() {
    isObscured = !isObscured;
  }
}
