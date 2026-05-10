import '../../../core/network/api_clients.dart';
import '../../../core/network/api_endpoints.dart';
import '../../models/connection_request_detail_model.dart';
import '../../models/connection_request_model.dart';
import '../../models/connection_request_status_model.dart';
import '../local/shared_preference/shared_preference.dart';

class ConnectionRequestApiService {
  final ApiClient apiClient;
  ConnectionRequestApiService({required this.apiClient});

  Future<List<ConnectionRequestModel>> getConnectionRequest() async {
    try {
      final token = await SharedPreferenceData.getToken();
      final headers = {'Authorization': 'Bearer $token'};
      final response = await apiClient.getRequest(
        endpoints: ApiEndpoints.connectionRequestUserList,
        headers: headers,
      );

      if (response != null && response['success'] == true) {
        return (response['data'] as List)
            .map((x) => ConnectionRequestModel.fromJson(x))
            .toList();
      } else {
        return [];
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<ConnectionRequestDetailModel?> getConnectionRequestDetail({
    required String id,
  }) async {
    try {
      final token = await SharedPreferenceData.getToken();
      final headers = {'Authorization': 'Bearer $token'};
      final response = await apiClient.getRequest(
        endpoints: ApiEndpoints.connectionRequestDetail(id: id),
        headers: headers,
      );

      if (response != null && response['success'] == true) {
        return ConnectionRequestDetailModel.fromJson(response['data']);
      } else {
        return null;
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<ConnectionRequestStatusModel?> getConnectionRequestStatus({
    required String id,
    required String status,
  }) async {
    try {
      final token = await SharedPreferenceData.getToken();
      final headers = {'Authorization': 'Bearer $token'};
      final response = await apiClient.getRequest(
        endpoints: ApiEndpoints.connectionRequestStatus(id: id, status: status),
        headers: headers,
      );

      if (response != null && response['success'] == true) {
        return ConnectionRequestStatusModel.fromJson(response['data']);
      } else {
        return null;
      }
    } catch (error) {
      rethrow;
    }
  }
}
