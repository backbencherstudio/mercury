import 'package:mercury/core/network/api_clients.dart';

import '../../../core/constansts/color_manger.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/resource/utils.dart';
import '../../models/api_response_model.dart';
import '../local/shared_preference/shared_preference.dart';

class SupportApiService {
  final ApiClient apiClient;

  SupportApiService({required this.apiClient});

  Future<ResponseModel> supportRequest() async {
    try {
      final token = await SharedPreferenceData.getToken();
      final headers = token != null ? {'Authorization': 'Bearer $token'} : null;
      final response = await apiClient.postRequest(
        headers: headers,
        endpoints: ApiEndpoints.supportRequest,
      );
      if (response['success'] == true) {
        Utils.showToast(
          message: response['message'],
          backgroundColor: ColorManager.primary,
          textColor: ColorManager.whiteColor,
        );
        return ResponseModel(true, response['message'], data: response['type']);
      } else {
        Utils.showToast(
          message: response['message'],
          backgroundColor: ColorManager.errorColor,
          textColor: ColorManager.whiteColor,
        );
        return ResponseModel(false, response['message']);
      }
    } catch (e) {
      return ResponseModel(false, e.toString());
    }
  }

}
