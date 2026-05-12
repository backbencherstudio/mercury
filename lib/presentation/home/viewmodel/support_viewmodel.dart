import 'package:flutter_riverpod/legacy.dart';
import 'package:mercury/core/network/api_clients.dart';
import 'package:mercury/data/repositories/support_repository.dart';
import 'package:mercury/data/sources/remote/support_api_service.dart';

import '../../../../data/models/api_response_model.dart';

final supportRequestProvider = StateNotifierProvider(
  (ref) => SupportRequestNotifier(
    repository: SupportRepository(
      remoteSource: SupportApiService(apiClient: ApiClient()),
    ),
  ),
);

class SupportRequestNotifier extends StateNotifier<bool> {
  final SupportRepository repository;
  SupportRequestNotifier({required this.repository}) : super(false);

  Future<ResponseModel> supportRequest() async {
    state = true;
    final response = await repository.supportRequest();
    state = false;
    return response;
  }
}
