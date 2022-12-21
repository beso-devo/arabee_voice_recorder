class UserModel {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String token;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        token: json['token']);
  }
}
