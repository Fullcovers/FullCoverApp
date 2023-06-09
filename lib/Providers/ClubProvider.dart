import '../Models/Clubs.dart';
import 'package:flutter/cupertino.dart';

class ClubProvider with ChangeNotifier {
  List<ClubModel> clubsData = [];

  void setClubsData(List<dynamic> data) {
    clubsData = data
        .map((item) => ClubModel(
              id: item['_id'],
              user: item['user'],
              name: item['name'],
              description: item['description'],
              address: item['address'],
              logo: item['logo'],
              termsAndCondition: item['terms_and_condition'],
              events: List<String>.from(item['events']),
              carouselImages: List<CarouselImageModel>.from(
                  item['carousel_images']
                      .map((carouselItem) => CarouselImageModel(
                            name: carouselItem['name'],
                            imageUrl: carouselItem['imageUrl'],
                            id: carouselItem['_id'],
                          ))),
              socials: List<SocialModel>.from(
                  item['socials'].map((socialItem) => SocialModel(
                        name: socialItem['name'],
                        url: socialItem['url'],
                        id: socialItem['_id'],
                      ))),
            ))
        .toList();

    notifyListeners();
  }

  ClubModel getClubDetails(String clubId) {
    return clubsData.firstWhere((club) => club.id == clubId);
  }
}
