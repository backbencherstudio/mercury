import 'package:flutter_riverpod/legacy.dart';
import 'package:mercury/core/network/api_clients.dart';
import 'package:mercury/data/sources/remote/watch_video_api_service.dart';

import '../../../data/models/watch_video_model.dart';
import '../../../data/repositories/watch_video_repository.dart';

final watchVideoProvider =
    StateNotifierProvider<WatchVideoViewModel, List<WatchVideoModel>?>(
      (ref) => WatchVideoViewModel(
        repository: WatchVideoRepository(
          remoteSource: WatchVideoApiService(apiClient: ApiClient()),
        ),
      ),
    );

class WatchVideoViewModel extends StateNotifier<List<WatchVideoModel>?> {
  final WatchVideoRepository repository;
  WatchVideoViewModel({required this.repository}) : super(null);

  Future<void> getWatchVideo() async {
    state = await repository.getWatchVideo();
  }
}
