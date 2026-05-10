import 'package:mercury/data/models/lead_activity_model.dart';

import '../sources/remote/lead_activity_api_service.dart';

class LeadActivityRepository {
  final LeadActivityApiService leadActivityApiService;
  LeadActivityRepository({required this.leadActivityApiService});

  Future<LeadActivityModel> getLeadActivity({required String startDate, required String endDate}) async {
    return await leadActivityApiService.getLeadActivity(startDate: startDate, endDate: endDate);
  }
}