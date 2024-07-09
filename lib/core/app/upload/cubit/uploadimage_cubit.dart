import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storeapp/core/app/upload/repo/upload_image_repo.dart';
import 'package:storeapp/core/util/image_picker.dart';

part 'uploadimage_state.dart';
part 'uploadimage_cubit.freezed.dart';

class UploadimageCubit extends Cubit<UploadimageState> {
  UploadimageCubit(this._repo) : super(const UploadimageState.initial());
  final UploadImageRepo _repo;
  String getImageUrl = '';
  //pick image and save it in file and upload in server
  Future<void> uploadImage() async {
    final pickedImage = await PickImageUtiles().pickImage();
    if (pickedImage == null) {
      return;
    }
    emit(const UploadimageState.loading());
    final result = await _repo.uploadImage(pickedImage);
    result.when(success: (image) {
      getImageUrl = image.location ?? '';
      emit(const UploadimageState.success());
    }, failure: (error) {
      emit(UploadimageState.faliure(errMessage: error));
    });
  }

  //delete image from server
  void removeImage() {
    getImageUrl = '';
    emit(UploadimageState.removeImage(imageUrl: getImageUrl));
  }
}
