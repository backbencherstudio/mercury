import '../models/notification_model.dart';
import '../sources/remote/notification_api_service.dart';

class NotificationRepository {
  final NotificationApiService remoteSource;
  NotificationRepository({required this.remoteSource});

  Future<List<NotificationModel>?> getNotifications() async {
    return await remoteSource.getNotifications();
  }
}
