class UserModel {
  String id;
  UserData data;
  String message;

  UserModel({
    required this.id,
    required this.data,
    required this.message,
  });
}

class UserData {
  Name name;
  String id;
  String email;
  String password;
  String phoneNumber;
  String role;
  String image;
  bool isVerified;
  int covercoin;
  int v;

  UserData({
    required this.name,
    required this.id,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.role,
    required this.image,
    required this.covercoin,
    required this.isVerified,
    required this.v,
  });
}

class Name {
  String firstName;
  String lastName;

  Name({
    required this.firstName,
    required this.lastName,
  });
}
