import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:cloudinary/cloudinary.dart';

class Upload {
  final cloudinary = Cloudinary.signedConfig(
    apiKey: "538483726846567",
    apiSecret: "pN4v-PM_tmbzdirmEkcqYU19hCI",
    cloudName: "dm77rbalw",
  );
  Future<String?> uploadimage(XFile file) async {
    File file1 = File(file.path);

    final response = await cloudinary.upload(
        file: file.path,
        fileBytes: file1.readAsBytesSync(),
        resourceType: CloudinaryResourceType.image,
        folder: "FullCover",
        fileName: DateTime.now().toString(),
        progressCallback: (count, total) {
          print('Uploading image from file with progress: $count/$total');
        });
    if (response.isSuccessful) {
      print('Get your image from with ${response.secureUrl}');
    }
    return response.secureUrl;
  }
}
