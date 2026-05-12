import 'package:mercury/data/models/watch_video_model.dart';
import 'package:mercury/data/sources/remote/watch_video_api_service.dart';

class WatchVideoRepository {
  final WatchVideoApiService remoteSource;
  WatchVideoRepository({required this.remoteSource});

  Future<List<WatchVideoModel>?> getWatchVideo() async {
    return await remoteSource.getWatchVideo();
  }
}