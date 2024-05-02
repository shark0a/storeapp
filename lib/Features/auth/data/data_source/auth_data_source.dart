import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/Features/auth/data/models/login_request.dart';
import 'package:storeapp/Features/auth/data/models/login_response.dart';
import 'package:storeapp/Features/auth/data/models/user_role_response.dart';
import 'package:storeapp/core/services/graphql/api_service.dart';
import 'package:storeapp/core/services/graphql/graphql_queries/auth_queries.dart';

class AuthDataSource {
  const AuthDataSource(this._graphql);

  final ApiService _graphql;

  //Login
  Future<LoginResponse> login({required LoginRequest body}) async {
    final response =
        await _graphql.login(AuthQueries().loginMapQuery(body: body));
    return response;
  }

  //UserRole
  Future<UserRoleRsponse> userRole(String token) async {
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    final client = ApiService(dio);
    final response = await client.userRole();
    debugPrint('User Role => ${response.userRole}');
    return response;
  }
}
