import 'package:storeapp/Features/auth/data/models/login_request.dart';

class AuthQueries {
  const AuthQueries._();
  factory AuthQueries() {
    return _instance;
  }
  static const AuthQueries _instance = AuthQueries._();
  Map<String, dynamic> loginMapQueries({required LoginRequest body}) {
    return {
      'query': r'''
                mutation Login($email: String! ,$password: String!){
                  login(email: "$email", password: "$password") {
                    access_token
                    refresh_token
                  }
                }
              ''',
              'variables':{
                'email':body.email,
                'password':body.password,
              }
    };
  }
}
