import 'package:flutter_riverpod/legacy.dart';
import 'package:mercury/core/network/api_clients.dart';
import 'package:mercury/data/sources/remote/connection_request_api_service.dart';
import '../../../data/models/connection_request_status_model.dart';
import '../../../data/repositories/connection_request_repository.dart';

final connectionRequestStatusProvider =
    StateNotifierProvider<
      ConnectionRequestViewModel,
      ConnectionRequestStatusModel?
    >(
      (ref) => ConnectionRequestViewModel(
        repository: ConnectionRequestRepository(
          remoteSource: ConnectionRequestApiService(apiClient: ApiClient()),
        ),
      ),
    );

class ConnectionRequestViewModel
    extends StateNotifier<ConnectionRequestStatusModel?> {
  final ConnectionRequestRepository repository;
  ConnectionRequestViewModel({required this.repository}) : super(null);

  Future<void> getConnectionRequestStatus({
    required String id,
    required String status,
  }) async {
    final response = await repository.getConnectionRequestStatus(
      id: id,
      status: status,
    );
    state = response;
  }
}
