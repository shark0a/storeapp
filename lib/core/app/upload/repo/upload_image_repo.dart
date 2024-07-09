import 'package:image_picker/image_picker.dart';
import 'package:storeapp/core/app/upload/data_source/uplaod_image_data_source.dart';
import 'package:storeapp/core/app/upload/model/upload_image_response.dart';
import 'package:storeapp/core/language/lang_keys.dart';
import 'package:storeapp/core/services/graphql/api_result.dart';

class UploadImageRepo {
  UploadImageRepo(this._dataSource);
  final UploadImageDataSource _dataSource;
  Future<ApiResult<UploadImageResourse>> uploadImage(XFile fileImage) async {
    try {
      final resposne = await _dataSource.uploadImage(fileImage: fileImage);
      return ApiResult.success(resposne);
    } catch (e) {
      return const ApiResult.failure(LangKeys.signUp);
    }
  }
}
