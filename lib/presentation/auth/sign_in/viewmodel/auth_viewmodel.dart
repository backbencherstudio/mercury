import 'package:flutter_riverpod/legacy.dart';
import 'package:mercury/core/network/api_clients.dart';
import 'package:mercury/data/repositories/auth_repository.dart';
import 'package:mercury/data/sources/remote/auth_api_service.dart';

import '../../../../data/models/api_response_model.dart';

final authProvider = StateNotifierProvider(
  (ref) => SignInNotifier(
    repository: AuthRepository(
      authApiService: AuthApiService(apiClient: ApiClient()),
    ),
  ),
);

class SignInNotifier extends StateNotifier<bool> {
  final AuthRepository repository;
  SignInNotifier({required this.repository}) : super(false);

  Future<ResponseModel> login({
    required String email,
    required String password,
  }) async {
    state = true;
    final response = await repository.login(email: email, password: password);
    state = false;
    return response;
  }
}
