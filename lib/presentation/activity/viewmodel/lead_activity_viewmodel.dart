import 'package:flutter_riverpod/legacy.dart';
import '../../../core/network/api_clients.dart';
import '../../../data/models/lead_activity_model.dart';
import '../../../data/repositories/lead_activity_repository.dart';
import '../../../data/sources/remote/lead_activity_api_service.dart';

final leadActivityProvider = StateNotifierProvider<LeadActivityViewModel, bool>(
  (ref) => LeadActivityViewModel(
    repository: LeadActivityRepository(
      leadActivityApiService: LeadActivityApiService(apiClient: ApiClient()),
    ),
  ),
);

class LeadActivityViewModel extends StateNotifier<bool> {
  final LeadActivityRepository repository;
  LeadActivityModel? leadActivityData;

  LeadActivityViewModel({required this.repository}) : super(false);

  Future<void> getLeadActivity({required String startDate, required String endDate}) async {
    state = true;
    final result = await repository.getLeadActivity(startDate: startDate, endDate: endDate);
    leadActivityData = result;
    state = false;
  }
}
