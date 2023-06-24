class QrUserModel {
  String id;
  List<QrUserData> data;
  String message;

  QrUserModel({
    required this.id,
    required this.data,
    required this.message,
  });
}

class QrUserData {
  QrName name;
  String id;
  String email;
  String password;
  String role;
  String image;
  int coverCoins;
  bool isVerified;
  int v;

  QrUserData({
    required this.name,
    required this.id,
    required this.email,
    required this.password,
    required this.role,
    required this.image,
    required this.coverCoins,
    required this.isVerified,
    required this.v,
  });
}

class QrName {
  String firstName;
  String lastName;

  QrName({
    required this.firstName,
    required this.lastName,
  });
}
