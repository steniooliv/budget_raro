import 'dart:convert';

class UserModel {
  String? name;
  String email;
  String? cpf;
  String? phone;
  String uid;

  UserModel({
    this.name,
    required this.email,
    this.cpf,
    this.phone,
    required this.uid,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? cpf,
    String? phone,
    String? uid,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      cpf: cpf ?? this.cpf,
      phone: phone ?? this.phone,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'cpf': cpf,
      'phone': phone,
      'uid': uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      cpf: map['cpf'],
      phone: map['phone'],
      uid: map['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, cpf: $cpf, phone: $phone, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.email == email &&
        other.cpf == cpf &&
        other.phone == phone &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        cpf.hashCode ^
        phone.hashCode ^
        uid.hashCode;
  }
}
