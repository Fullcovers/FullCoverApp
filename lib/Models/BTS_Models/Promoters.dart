class PromoterModel {
  final String id;
  final String club;
  final UserModel user;
  final String promoCode;
  final int discount;
  final DateTime createdAt;
  final DateTime updatedAt;

  PromoterModel({
    required this.id,
    required this.club,
    required this.user,
    required this.promoCode,
    required this.discount,
    required this.createdAt,
    required this.updatedAt,
  });
}

class UserModel {
  final String id;
  final NameModel name;
  final String email;
  final String password;
  final String phoneNumber;
  final String role;
  final String image;
  final bool isVerified;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.role,
    required this.image,
    required this.isVerified,
  });
}

class NameModel {
  final String firstName;
  final String lastName;

  NameModel({
    required this.firstName,
    required this.lastName,
  });
}
