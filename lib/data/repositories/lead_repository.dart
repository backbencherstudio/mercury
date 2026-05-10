import 'dart:io';
import '../models/api_response_model.dart';
import '../models/trade_model.dart';
import '../sources/remote/lead_api_service.dart';

class LeadRepository {
  final LeadApiService remoteSourse;
  LeadRepository({required this.remoteSourse});
  Future<ResponseModel> addLead({
    required String address,
    required String name,
    required String phoneNumber,
    // ignore: non_constant_identifier_names
    required String trade_id,
    required String notes,
    required List<File> files,
  }) async {
    return await remoteSourse.addLead(
      address: address,
      name: name,
      phoneNumber: phoneNumber,
      trade_id: trade_id,
      notes: notes,
      files: files,
    );
  }

  Future<List<TradeModel>> getTrades() async {
    return await remoteSourse.getTrades();
  }
}
