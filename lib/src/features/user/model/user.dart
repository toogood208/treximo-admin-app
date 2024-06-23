class User {
  User({
    required this.status,
    required this.message,
    required this.data,
  });

  final String? status;
  final String? message;
  final List<UserData> data;

  User copyWith({
    String? status,
    String? message,
    List<UserData>? data,
  }) {
    return User(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<UserData>.from(json["data"]!.map((x) => UserData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$status, $message, $data, ";
  }
}

class UserData {
  UserData({
    required this.id,
    required this.userType,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  final int? id;
  final String? userType;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? password;

  UserData copyWith({
    int? id,
    String? userType,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? password,
  }) {
    return UserData(
      id: id ?? this.id,
      userType: userType ?? this.userType,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json["id"],
      userType: json["userType"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "userType": userType,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
      };

  @override
  String toString() {
    return "$id, $userType, $firstName, $lastName, $email, $phoneNumber, $password ";
  }
}
