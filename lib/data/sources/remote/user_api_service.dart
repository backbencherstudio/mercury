// lib/data/sources/remote/user_api_service.dart
import '../../../core_copy/network/api_clients.dart';

class UserApiService {
  final ApiClient apiClient;

  UserApiService({required this.apiClient});

  // Future<List<UserModel>> fetchUsers() async {
  //   final Response response = await apiClient.getRequest(endpoints:  ApiEndpoints.users);
  //   final List data = response.data as List;
  //   return data.map((json) => UserModel.fromJson(json)).toList();
  // }
}

