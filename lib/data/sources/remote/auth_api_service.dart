import 'dart:developer';

import 'package:mercury/core/constansts/color_manger.dart';
import 'package:mercury/core/network/api_clients.dart';
import 'package:mercury/data/models/api_response_model.dart';

import '../../../core/network/api_endpoints.dart';
import '../../../core/resource/utils.dart';
import '../local/shared_preference/shared_preference.dart';

class AuthApiService {
  final ApiClient apiClient;
  AuthApiService({required this.apiClient});

  Future<ResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final body = {"email": email, "password": password};

      final response = await apiClient.postRequest(
        endpoints: ApiEndpoints.login,
        body: body,
      );

      log(response.toString());

      if (response['success'] == true) {
        await SharedPreferenceData.setToken(
          response['authorization']['access_token'],
        );
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
    } catch (error) {
      return ResponseModel(false, error.toString());
    }
  }
}
