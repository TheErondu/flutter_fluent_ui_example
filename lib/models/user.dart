// ignore_for_file: unnecessary_new

class User {
  String? message;
  int? userId;
  String? name;
  String? email;
  String? department;
  int? departmentId;
  String? role;
  String? accessToken;
  String? tokenType;

  User(
      {this.message,
      this.userId,
      this.name,
      this.email,
      this.department,
      this.departmentId,
      this.role,
      this.accessToken,
      this.tokenType});

  User.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    department = json['department'];
    departmentId = json['department_id'];
    role = json['role'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['user_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['department'] = department;
    data['department_id'] = departmentId;
    data['role'] = role;
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    return data;
  }
}
