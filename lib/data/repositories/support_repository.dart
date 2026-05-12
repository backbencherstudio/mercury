import 'package:mercury/data/models/api_response_model.dart';
import 'package:mercury/data/sources/remote/support_api_service.dart';

class SupportRepository {
  final SupportApiService remoteSource;

  SupportRepository({required this.remoteSource});

  Future<ResponseModel> supportRequest() async {
    return await remoteSource.supportRequest();
  }
}