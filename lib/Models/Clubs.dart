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
  final List<SocialModel> socials;

  ClubModel({
    required this.id,
    required this.user,
    required this.name,
    required this.description,
    required this.address,
    required this.logo,
    required this.termsAndCondition,
    required this.events,
    required this.carouselImages,
    required this.socials,
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
