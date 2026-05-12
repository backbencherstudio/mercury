import 'package:mercury/core/network/api_clients.dart';
import 'package:mercury/data/models/watch_video_model.dart';

import '../../../core/network/api_endpoints.dart';
import '../local/shared_preference/shared_preference.dart';

class WatchVideoApiService {
  ApiClient apiClient;
  WatchVideoApiService({required this.apiClient});

  Future<List<WatchVideoModel>?> getWatchVideo() async {
    try {
      final token = await SharedPreferenceData.getToken();
      final headers = {'Authorization': 'Bearer $token'};
      final response = await apiClient.getRequest(
        endpoints: ApiEndpoints.watchVideo,
        headers: headers,
      );
      if (response['success']) {
        final List<WatchVideoModel> data = [];
        for (var item in response['data']) {
          data.add(WatchVideoModel.fromJson(item));
        }
        return data;
      } else {
        return null;
      }
    } catch (error) {
      rethrow;
    }
  }
}
