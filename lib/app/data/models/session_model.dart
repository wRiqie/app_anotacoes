class SessionModel {
  final String? id;
  final String? name;
  final String? email;

  SessionModel({
    this.id,
    this.name,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory SessionModel.fromMap(Map<String, dynamic> map) {
    return SessionModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
    );
  }

  SessionModel copyWith({
    String? id,
    String? name,
    String? photoUrl,
    String? email,
  }) {
    return SessionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
