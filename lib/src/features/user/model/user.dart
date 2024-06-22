class User {
  final int id;
  final String userType;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  User(
      {required this.id,
      required this.userType,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        userType = json['userType'] as String,
        firstName = json['firstName'] as String,
        lastName = json['lastName'] as String,
        email = json['email'] as String,
        phoneNumber = json['phoneNumber'] as String;

  Map<String, dynamic> toJson() => {
        'id': id,
        "userType": userType,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber
      };
}
