import 'package:mercury/data/models/user_model.dart';
import '../../../core/network/api_clients.dart';
import '../../../core/network/api_endpoints.dart';
import '../local/shared_preference/shared_preference.dart';

class UserApiService {
  final ApiClient apiClient;

  UserApiService({required this.apiClient});

  Future<UserModel> getUser() async {
    try {
      final token = await SharedPreferenceData.getToken();
      final response = await apiClient.getRequest(
        endpoints: ApiEndpoints.user,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response != null && response['success'] == true) {
        return UserModel.fromJson(response['data']);
      } else {
        return UserModel();
      }
    } catch (error) {
      rethrow;
    }
  }
}
