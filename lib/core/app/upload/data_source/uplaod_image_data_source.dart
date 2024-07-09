import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:storeapp/core/app/upload/model/upload_image_response.dart';
import 'package:storeapp/core/services/graphql/api_service.dart';

class UploadImageDataSource {
  UploadImageDataSource(this._api);
  final ApiService _api;
  Future<UploadImageResourse> uploadImage({required XFile fileImage}) async {
    final formData = FormData();

    formData.files
        .add(MapEntry('file', await MultipartFile.fromFile(fileImage.path)));

    final response = await _api.uploadImage(formData);
    return response;
  }
}
