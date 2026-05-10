import 'package:flutter_riverpod/legacy.dart';
import 'package:mercury/core/network/api_clients.dart';
import 'package:mercury/data/sources/remote/connection_request_api_service.dart';
import '../../../data/models/connection_request_detail_model.dart';
import '../../../data/repositories/connection_request_repository.dart';

final connectionRequestDetailProvider =
    StateNotifierProvider<
      ConnectionRequestViewModel,
     ConnectionRequestDetailModel?
    >(
      (ref) => ConnectionRequestViewModel(
        repository: ConnectionRequestRepository(
          remoteSource: ConnectionRequestApiService(apiClient: ApiClient()),
        ),
      ),
    );

class ConnectionRequestViewModel
    extends StateNotifier<ConnectionRequestDetailModel?> {
  final ConnectionRequestRepository repository;
  ConnectionRequestViewModel({required this.repository}) : super(null);

  Future<void> getConnectionRequestDetail({required String id}) async {
    final response = await repository.getConnectionRequestDetail(id: id);
    state = response;
  }
}
