// class ClubModel {
//   final String id;
//   final String user;
//   final String name;
//   final String description;
//   final String address;
//   final String logo;
//   final String termsAndCondition;
//   final List<String> events;
//   final List<CarouselImageModel> carouselImages;
//   final List<SocialModel> socials;

//   ClubModel({
//     required this.id,
//     required this.user,
//     required this.name,
//     required this.description,
//     required this.address,
//     required this.logo,
//     required this.termsAndCondition,
//     required this.events,
//     required this.carouselImages,
//     required this.socials,
//   });
// }

// class CarouselImageModel {
//   final String name;
//   final String imageUrl;
//   final String id;

//   CarouselImageModel({
//     required this.name,
//     required this.imageUrl,
//     required this.id,
//   });
// }

// class SocialModel {
//   final String name;
//   final String url;
//   final String id;

//   SocialModel({
//     required this.name,
//     required this.url,
//     required this.id,
//   });
// }

class ClubModel {
  final String id;
  final String user;
  final String name;
  final String description;
  final String address;
  final String logo;
  final String termsAndCondition;
  final List<String> events;
  final List<CarouselImageModel> carouselImages;
  final List<SocialModel> socials;final String type_of;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> tickets;
  final List<String> facilities;
  final String heroImage;
  final bool isClubOpen;
  final ClubTimings timings;
  final ClubOpenDays daysOpen;
  final Clubdaddress daddress;

  ClubModel({
    required this.id,
    required this.user,
    required this.name,
    required this.description,
    required this.type_of,
    required this.address,
    required this.logo,
    required this.termsAndCondition,
    required this.events,
    required this.carouselImages,
    required this.socials,
    required this.createdAt,
    required this.updatedAt,
    required this.tickets,
    required this.facilities,
    required this.heroImage,
    required this.isClubOpen,
    required this.timings,
    required this.daysOpen,
    required this.daddress,
  });
}

class CarouselImageModel {
  final String name;
  final String imageUrl;
  final String id;

  CarouselImageModel({
    required this.name,
    required this.imageUrl,
    required this.id,
  });
}

class SocialModel {
  final String name;
  final String url;
  final String id;

  SocialModel({
    required this.name,
    required this.url,
    required this.id,
  });
}

class ClubTimings {
  final String closesAt;
  final String opensAt;

  ClubTimings({
    required this.closesAt,
    required this.opensAt,
  });
}

class Clubdaddress {
  final String city;
  final String plot;
  final String postalcode;
  final String state;
  final String landmark;
  Clubdaddress({
    required this.city,
    required this.plot,
    required this.postalcode,
    required this.state,
    required this.landmark,
  });
}

class ClubOpenDays {
  final String from;
  final String till;

  ClubOpenDays({
    required this.from,
    required this.till,
  });
}
