import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_role_response.g.dart';

@JsonSerializable()
class UserRoleRsponse {
  UserRoleRsponse(this.userRole, this.useId);
  factory UserRoleRsponse.fromJson(Map<String, dynamic> json) =>
      _$UserRoleRsponseFromJson(json);
  @JsonKey(name: 'role')
  final String? userRole;
  @JsonKey(name: 'id')
  final int? useId;
}
