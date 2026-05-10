import 'package:mercury/data/models/lead_activity_model.dart';

import '../../../core/network/api_clients.dart';
import '../../../core/network/api_endpoints.dart';
import '../local/shared_preference/shared_preference.dart';

class LeadActivityApiService {
  final ApiClient apiClient;
  LeadActivityApiService({required this.apiClient});

  Future<LeadActivityModel> getLeadActivity({required String startDate, required String endDate}) async {
    try {
      final token = await SharedPreferenceData.getToken();
      final response = await apiClient.getRequest(
        endpoints: ApiEndpoints.leadActivity(startDate: startDate, endDate: endDate),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response != null && response['success'] == true) {
        return LeadActivityModel.fromJson(response['data']);
      } else {
        return LeadActivityModel();
      }
    } catch (error) {
      rethrow;
    }
  }
}
