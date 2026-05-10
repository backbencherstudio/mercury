import 'package:mercury/data/sources/remote/connection_request_api_service.dart';

import '../models/connection_request_detail_model.dart';
import '../models/connection_request_model.dart';
import '../models/connection_request_status_model.dart';

class ConnectionRequestRepository {
  final ConnectionRequestApiService remoteSource;
  ConnectionRequestRepository({required this.remoteSource});

  Future<List<ConnectionRequestModel?>> getConnectionRequest() async {
    return await remoteSource.getConnectionRequest();
  }

  Future<ConnectionRequestDetailModel?> getConnectionRequestDetail({
    required String id,
  }) async {
    return await remoteSource.getConnectionRequestDetail(id: id);
  }

    Future<ConnectionRequestStatusModel?> getConnectionRequestStatus({
    required String id,
    required String status,
  }) async {
    return await remoteSource.getConnectionRequestStatus(id: id,status: status);
  }
}
