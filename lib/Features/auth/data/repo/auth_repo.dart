import 'package:storeapp/Features/auth/data/data_source/auth_data_source.dart';
import 'package:storeapp/Features/auth/data/models/login_request.dart';
import 'package:storeapp/Features/auth/data/models/login_response.dart';
import 'package:storeapp/Features/auth/data/models/sign_up_request.dart';
import 'package:storeapp/Features/auth/data/models/sign_up_response.dart';
import 'package:storeapp/Features/auth/data/models/user_role_response.dart';
import 'package:storeapp/core/language/lang_keys.dart';
import 'package:storeapp/core/services/graphql/api_result.dart';

class AuthRepos {
  const AuthRepos(this._dataSource);
  final AuthDataSource _dataSource;
  //Login
  Future<ApiResult<LoginResponse>> login(LoginRequest body) async {
    try {
      final response = await _dataSource.login(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(LangKeys.loggedError);
    }
  }
  //Register sign up 
  Future<ApiResult<SignUpResponse>>signUp(SignUpRequest body)async{
try {
  final response =await _dataSource.signUp(body: body);
  return ApiResult.success(response);
} catch (e) {
  return const ApiResult.failure(LangKeys.signUpError);
}

  }

  //Get User Role
  Future<UserRoleRsponse> userRoel(String token) async {
    final response = await _dataSource.userRole(token);
    return response;
  }
}
