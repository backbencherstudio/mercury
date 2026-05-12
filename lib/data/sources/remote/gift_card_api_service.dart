import '../../../core/network/api_clients.dart';
import '../../../core/network/api_endpoints.dart';
import '../../models/gift_card_model.dart';
import '../local/shared_preference/shared_preference.dart';

class GiftCardApiService {
  final ApiClient apiClient;
  GiftCardApiService({required this.apiClient});

  Future<List<GiftCardModel>?> getGiftCardStatus() async {
    try {
      final token = await SharedPreferenceData.getToken();
      final response = await apiClient.getRequest(
        endpoints: ApiEndpoints.giftcardStatus,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response != null) {
        if (response is List) {
          return response.map((x) => GiftCardModel.fromJson(x)).toList();
        } else if (response is Map && (response['success'] == true || response['status'] == true)) {
          return (response['data'] as List)
              .map((x) => GiftCardModel.fromJson(x))
              .toList();
        }
      }
      return [];
    } catch (error) {
      rethrow;
    }
  }
} 