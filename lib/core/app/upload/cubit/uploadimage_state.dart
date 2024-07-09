part of 'uploadimage_cubit.dart';

@freezed
class UploadimageState with _$UploadimageState {
  const factory UploadimageState.initial() = _Initial;
  const factory UploadimageState.loading() = Loadingstate;
  const factory UploadimageState.success() = SuccessState;
  const factory UploadimageState.removeImage({required String imageUrl}) =
      RemoveImageState;
  const factory UploadimageState.faliure({required String errMessage}) =
      Faliurstate;
}
