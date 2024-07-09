import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  final String? name;
  final String? email;
  final String? password;
  final String? avatar;

  SignUpRequest(
      {required this.name,
      required this.email,
      required this.password,
      required this.avatar});
  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
