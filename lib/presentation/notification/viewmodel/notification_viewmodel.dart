import 'package:flutter_riverpod/legacy.dart';

import '../../../core/network/api_clients.dart';
import '../../../data/models/notification_model.dart';
import '../../../data/repositories/notification_repository.dart';
import '../../../data/sources/remote/notification_api_service.dart';

final notificationProvider =
    StateNotifierProvider<NotificationViewModel, List<NotificationModel?>>(
      (ref) => NotificationViewModel(
        repository: NotificationRepository(
          remoteSource: NotificationApiService(apiClient: ApiClient()),
        ),
      ),
    );

class NotificationViewModel extends StateNotifier<List<NotificationModel?>> {
  final NotificationRepository repository;
  NotificationViewModel({required this.repository}) : super([]);

  Future<void> getNotifications() async {
    final response = await repository.getNotifications();
    state = response!;
  }
}
