import '../Models/Clubs.dart';
import 'package:flutter/cupertino.dart';

class ClubProvider with ChangeNotifier {
  List<ClubModel> clubsData = [];
  ClubModel? club;

  // void setClubsData(List<dynamic> data) {
  //   clubsData = data
  //       .map((item) => ClubModel(
  //             id: item['_id'],
  //             user: item['user'],
  //             name: item['name'],
  //             description: item['description'],
  //             address: item['address'],
  //             logo: item['logo'],
  //             termsAndCondition: item['terms_and_condition'],
  //             events: List<String>.from(item['events']),
  //             carouselImages: List<CarouselImageModel>.from(
  //                 item['carousel_images']
  //                     .map((carouselItem) => CarouselImageModel(
  //                           name: carouselItem['name'],
  //                           imageUrl: carouselItem['imageUrl'],
  //                           id: carouselItem['_id'],
  //                         ))),
  //             socials: List<SocialModel>.from(
  //                 item['socials'].map((socialItem) => SocialModel(
  //                       name: socialItem['name'],
  //                       url: socialItem['url'],
  //                       id: socialItem['_id'],
  //                     ))),
  //           ))
  //       .toList();

  //   notifyListeners();
  // }

  // ClubModel getClubDetails(Map<String, dynamic> item) {
  //   return ClubModel(
  //     id: item['_id'],
  //     user: item['user'],
  //     name: item['name'],
  //     description: item['description'],
  //     address: item['address'],
  //     logo: item['logo'],
  //     termsAndCondition: item['terms_and_condition'],
  //     events: List<String>.from(item['events']),
  //     carouselImages: List<CarouselImageModel>.from(
  //         item['carousel_images'].map((carouselItem) => CarouselImageModel(
  //               name: carouselItem['name'],
  //               imageUrl: carouselItem['imageUrl'],
  //               id: carouselItem['_id'],
  //             ))),
  //     socials: List<SocialModel>.from(
  //         item['socials'].map((socialItem) => SocialModel(
  //               name: socialItem['name'],
  //               url: socialItem['url'],
  //               id: socialItem['_id'],
  //             ))),
  //   );
  // }

  void setClubsData(List<dynamic> data) {
    clubsData = data
        .map((item) => ClubModel(
              id: item.containsKey('_id') ? item['_id'] : '',
              user: item.containsKey('user') ? item['user'] : '',
              name: item.containsKey('name') ? item['name'] : '',
              description:
                  item.containsKey('description') ? item['description'] : '',
              address: item.containsKey('address') ? item['address'] : '',
              logo: item.containsKey('logo') ? item['logo'] : '',
              termsAndCondition: item.containsKey('terms_and_condition')
                  ? item['terms_and_condition']
                  : '',
              events: item.containsKey('events')
                  ? List<String>.from(item['events'])
                  : [],
              carouselImages: item.containsKey('carousel_images')
                  ? List<CarouselImageModel>.from(
                      (item['carousel_images'] as List<dynamic>).map(
                      (carouselItem) => CarouselImageModel(
                        name: carouselItem.containsKey('name')
                            ? carouselItem['name']
                            : '',
                        imageUrl: carouselItem.containsKey('imageUrl')
                            ? carouselItem['imageUrl']
                            : '',
                        id: carouselItem.containsKey('_id')
                            ? carouselItem['_id']
                            : '',
                      ),
                    ))
                  : [],
              socials: item.containsKey('socials')
                  ? List<SocialModel>.from(
                      (item['socials'] as List<dynamic>).map(
                      (socialItem) => SocialModel(
                        name: socialItem.containsKey('name')
                            ? socialItem['name']
                            : '',
                        url: socialItem.containsKey('url')
                            ? socialItem['url']
                            : '',
                        id: socialItem.containsKey('_id')
                            ? socialItem['_id']
                            : '',
                      ),
                    ))
                  : [],
              createdAt: item.containsKey('createdAt')
                  ? DateTime.parse(item['createdAt'])
                  : DateTime.now(),
              updatedAt: item.containsKey('updatedAt')
                  ? DateTime.parse(item['updatedAt'])
                  : DateTime.now(),
              tickets: item.containsKey('tickets')
                  ? List<String>.from(item['tickets'])
                  : [],
              facilities: item.containsKey('facilities')
                  ? List<String>.from(item['facilities'])
                  : [],
              heroImage:
                  item.containsKey('hero_image') ? item['hero_image'] : '',
              isClubOpen: item.containsKey('is_club_open')
                  ? item['is_club_open']
                  : false,
              timings: item.containsKey('timings')
                  ? ClubTimings(
                      closesAt: item['timings'].containsKey('closesAt')
                          ? item['timings']['closesAt']
                          : '',
                      opensAt: item['timings'].containsKey('opensAt')
                          ? item['timings']['opensAt']
                          : '',
                    )
                  : ClubTimings(closesAt: '', opensAt: ''),
              daysOpen: item.containsKey('days_open')
                  ? ClubOpenDays(
                      from: item['days_open'].containsKey('from')
                          ? item['days_open']['from']
                          : '',
                      till: item['days_open'].containsKey('till')
                          ? item['days_open']['till']
                          : '',
                    )
                  : ClubOpenDays(from: '', till: ''),
            ))
        .toList();

    notifyListeners();
  }

  ClubModel getClubDetails(Map<String, dynamic> item) {
    return ClubModel(
      id: item.containsKey('_id') ? item['_id'] : '',
      user: item.containsKey('user') ? item['user'] : '',
      name: item.containsKey('name') ? item['name'] : '',
      description: item.containsKey('description') ? item['description'] : '',
      address: item.containsKey('address') ? item['address'] : '',
      logo: item.containsKey('logo') ? item['logo'] : '',
      termsAndCondition: item.containsKey('terms_and_condition')
          ? item['terms_and_condition']
          : '',
      events:
          item.containsKey('events') ? List<String>.from(item['events']) : [],
      carouselImages: item.containsKey('carousel_images')
          ? List<CarouselImageModel>.from(
              (item['carousel_images'] as List<dynamic>).map(
              (carouselItem) => CarouselImageModel(
                name: carouselItem.containsKey('name')
                    ? carouselItem['name']
                    : '',
                imageUrl: carouselItem.containsKey('imageUrl')
                    ? carouselItem['imageUrl']
                    : '',
                id: carouselItem.containsKey('_id') ? carouselItem['_id'] : '',
              ),
            ))
          : [],
      socials: item.containsKey('socials')
          ? List<SocialModel>.from((item['socials'] as List<dynamic>).map(
              (socialItem) => SocialModel(
                name: socialItem.containsKey('name') ? socialItem['name'] : '',
                url: socialItem.containsKey('url') ? socialItem['url'] : '',
                id: socialItem.containsKey('_id') ? socialItem['_id'] : '',
              ),
            ))
          : [],
      createdAt: item.containsKey('createdAt')
          ? DateTime.parse(item['createdAt'])
          : DateTime.now(),
      updatedAt: item.containsKey('updatedAt')
          ? DateTime.parse(item['updatedAt'])
          : DateTime.now(),
      tickets:
          item.containsKey('tickets') ? List<String>.from(item['tickets']) : [],
      facilities: item.containsKey('facilities')
          ? List<String>.from(item['facilities'])
          : [],
      heroImage: item.containsKey('hero_image') ? item['hero_image'] : '',
      isClubOpen:
          item.containsKey('is_club_open') ? item['is_club_open'] : false,
      timings: item.containsKey('timings')
          ? ClubTimings(
              closesAt: item['timings'].containsKey('closesAt')
                  ? item['timings']['closesAt']
                  : '',
              opensAt: item['timings'].containsKey('opensAt')
                  ? item['timings']['opensAt']
                  : '',
            )
          : ClubTimings(closesAt: '', opensAt: ''),
      daysOpen: item.containsKey('days_open')
          ? ClubOpenDays(
              from: item['days_open'].containsKey('from')
                  ? item['days_open']['from']
                  : '',
              till: item['days_open'].containsKey('till')
                  ? item['days_open']['till']
                  : '',
            )
          : ClubOpenDays(from: '', till: ''),
    );
  }

  void setSingleClub(ClubModel? c) {
    club = c;
  }

  ClubModel? getSingleclub() {
    return club;
  }

  void setclubnull() {
    club = null;
  }
}
