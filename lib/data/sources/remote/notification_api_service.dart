import '../../../core/network/api_clients.dart';
import '../../../core/network/api_endpoints.dart';
import '../../models/notification_model.dart';
import '../local/shared_preference/shared_preference.dart';

class NotificationApiService {
  final ApiClient apiClient;
  NotificationApiService({required this.apiClient});

  Future<List<NotificationModel>?> getNotifications() async {
    try {
      final token = await SharedPreferenceData.getToken();
      final response = await apiClient.getRequest(
        endpoints: ApiEndpoints.notifications,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response != null && response['success'] == true) {
        return (response['data'] as List)
            .map((x) => NotificationModel.fromJson(x))
            .toList();
      } else {
        return [];
      }
    } catch (error) {
      rethrow;
    }
  }
}