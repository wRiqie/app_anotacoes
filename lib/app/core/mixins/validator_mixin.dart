import 'package:app_anotacoes/app/core/helpers/app_helpers.dart';

mixin ValidatorsMixin {
  String? isNotEmpty(String? value, [String? message]) {
    if (value?.trim().isEmpty ?? true) return 'O campo é obrigatório';
    return null;
  }

  String? isValidEmail(String? value, [String? message]) {
    if (AppHelpers.hasSpecialChars(value)) {
      return message ?? 'A senha não pode ter caractéres especiais';
    }
    return null;
  }

  String? isValidPassword(String? value, [String? message]) {
    if ((value?.length ?? 0) < 2) {
      return message ?? 'A senha deve ter ao menos 2 caracteres';
    }
    return null;
  }

  String? hasSpecialChars(String? value, [String? message]) {
    if ((value?.length ?? 0) < 2) {
      return message ?? 'A senha deve ter ao menos 2 caracteres';
    }
    return null;
  }

  String? hasLessThanTwentyChars(String? value, [String? message]) {
    if ((value?.length ?? 0) > 20) {
      return message ?? 'O campo só pode ter no máximo 20 caracteres';
    }
    return null;
  }

  String? hasSpaceInEndOrStart(String? value, [String? message]) {
    if (value != value?.trim()) {
      return message ?? 'O campo não pode começar e/ou terminar com espaços';
    }
    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (var validator in validators) {
      final result = validator();
      if (result != null) return result;
    }
    return null;
  }
}
