import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
  final SignUpDataModel? data;

  SignUpResponse(this.data);
}

@JsonSerializable()
class SignUpDataModel {
  factory SignUpDataModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpDataModelFromJson(json);
  final AddUserModel addUserModel;

  SignUpDataModel(this.addUserModel);
}

@JsonSerializable()
class AddUserModel {
  factory AddUserModel.fromJson(Map<String, dynamic> json) =>
      _$AddUserModelFromJson(json);
  final String? id;
  final String? email;

  AddUserModel(this.id, this.email);
}
