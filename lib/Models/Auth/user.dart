class UserInfo {
  final String name;
  final String email;
  final String phone;
  final String password;

  UserInfo({
    required this.name,
    required this.email,
    this.phone = '',
    this.password = '',
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}
