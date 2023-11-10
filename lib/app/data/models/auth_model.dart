class AuthModel {
  final String? user;
  final String? password;

  AuthModel({
    this.user,
    this.password,
  });

  Map<String, dynamic> toSignin() {
    return {'user': user, 'password': password};
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      user: map['user'],
      password: map['password'],
    );
  }
}
