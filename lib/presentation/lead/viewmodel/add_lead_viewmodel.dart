import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../core/network/api_clients.dart';
import '../../../data/models/api_response_model.dart';
import '../../../data/models/trade_model.dart';
import '../../../data/repositories/lead_repository.dart';
import '../../../data/sources/remote/lead_api_service.dart';

final addLeadProvider = StateNotifierProvider<AddLeadViewModel, bool>(
  (ref) => AddLeadViewModel(
    repository: LeadRepository(
      remoteSourse: LeadApiService(apiClient: ApiClient()),
    ),
  ),
);

final tradesProvider = FutureProvider<List<TradeModel>>((ref) async {
  return ref.read(addLeadProvider.notifier).getTrades();
});


class AddLeadViewModel extends StateNotifier<bool> {
  final LeadRepository repository;
  AddLeadViewModel({required this.repository}) : super(false);

  Future<ResponseModel> addLead({
    required String address,
    required String name,
    required String phoneNumber,
    // ignore: non_constant_identifier_names
    required String trade_id,
    required String notes,
    required List<File> files,
  }) async {
    state = true;
    final response = await repository.addLead(
      address: address,
      name: name,
      phoneNumber: phoneNumber,
      trade_id: trade_id,
      notes: notes,
      files: files,
    );
    state = false;
    return response;
  }

  Future<List<TradeModel>> getTrades() async {
    return await repository.getTrades();
  }
}
