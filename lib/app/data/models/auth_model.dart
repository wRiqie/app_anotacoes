class AuthModel {
  final String? email;
  final String? password;

  AuthModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toSignin() {
    return {'email': email, 'passWord': password};
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      email: map['email'],
      password: map['password'],
    );
  }
}
