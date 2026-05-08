import 'package:mercury/data/models/api_response_model.dart';

import '../sources/remote/auth_api_service.dart';

class AuthRepository {
  final AuthApiService authApiService;
  AuthRepository({required this.authApiService});

  Future<ResponseModel> login({
    required String email,
    required String password,
  }) async {
    return await authApiService.login(email: email, password: password);
  }
}