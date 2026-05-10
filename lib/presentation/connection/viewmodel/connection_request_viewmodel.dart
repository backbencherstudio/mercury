import 'package:flutter_riverpod/legacy.dart';
import 'package:mercury/core/network/api_clients.dart';
import 'package:mercury/data/sources/remote/connection_request_api_service.dart';

import '../../../data/models/connection_request_model.dart';
import '../../../data/repositories/connection_request_repository.dart';

final connectionRequestProvider =
    StateNotifierProvider<
      ConnectionRequestViewModel,
      List<ConnectionRequestModel?>
    >(
      (ref) => ConnectionRequestViewModel(
        repository: ConnectionRequestRepository(
          remoteSource: ConnectionRequestApiService(apiClient: ApiClient()),
        ),
      ),
    );

class ConnectionRequestViewModel
    extends StateNotifier<List<ConnectionRequestModel?>> {
  final ConnectionRequestRepository repository;
  ConnectionRequestViewModel({required this.repository}) : super([]);

  Future<void> getConnectionRequest() async {
    final response = await repository.getConnectionRequest();
    state = response;
  }
}
