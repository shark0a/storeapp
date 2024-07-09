import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload_image_response.g.dart';

@JsonSerializable()
class UploadImageResourse {
  final String? location;
  factory UploadImageResourse.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResourseFromJson(json);
  UploadImageResourse(this.location);
}
