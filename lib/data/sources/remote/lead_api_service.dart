import 'dart:io';
import 'package:dio/dio.dart';
import '../../../core/constansts/color_manger.dart';
import '../../../core/network/api_clients.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/resource/utils.dart';
import '../../models/api_response_model.dart';
import '../../models/trade_model.dart';
import '../local/shared_preference/shared_preference.dart';

class LeadApiService {
  final ApiClient apiClient;
  LeadApiService({required this.apiClient});

  Future<ResponseModel> addLead({
    required String address,
    required String name,
    required String phoneNumber,
    // ignore: non_constant_identifier_names
    required String trade_id,
    required String notes,
    required List<File> files,
  }) async {
    try {
      final Map<String, dynamic> data = {
        'address': address,
        'name': name,
        'phone': phoneNumber,
        'trade_id': trade_id,
        'notes': notes,
      };
      if (files.isNotEmpty) {
        List<MultipartFile> photoFiles = [];
        for (var file in files) {
          photoFiles.add(await MultipartFile.fromFile(file.path));
        }
        data['files'] = photoFiles;
      }

      FormData formData = FormData.fromMap(data);
      final token = await SharedPreferenceData.getToken();
      final headers = token != null ? {'Authorization': 'Bearer $token'} : null;
      final response = await apiClient.postRequest(
        headers: headers,
        endpoints: ApiEndpoints.leads,
        formData: formData,
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

  Future<List<TradeModel>> getTrades() async {
    try {
      final token = await SharedPreferenceData.getToken();
      final response = await apiClient.getRequest(
        endpoints: ApiEndpoints.trades,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response != null && response['success'] == true) {
        return (response['data'] as List)
            .map((x) => TradeModel.fromJson(x))
            .toList();
      } else {
        return [];
      }
    } catch (error) {
      rethrow;
    }
  }
}
