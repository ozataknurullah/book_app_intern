// The UserModel class represents a user with three properties: id, email, and token.
class UserModel {
  final String id;
  final String email;
  final String token;

  UserModel({
    required this.id,
    required this.email,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'token': token,
    };
  }
}
