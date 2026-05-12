class WatchVideoModel {
  String? id;
  String? tutorialVideoUrl;
  String? meetingVideoUrl;
  int? tutorialUnskippableDuration;
  int? meetingUnskippableDuration;

  WatchVideoModel({
    this.id,
    this.tutorialVideoUrl,
    this.meetingVideoUrl,
    this.tutorialUnskippableDuration,
    this.meetingUnskippableDuration,
  });

  WatchVideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tutorialVideoUrl = json['tutorial_video_url'];
    meetingVideoUrl = json['meeting_video_url'];
    tutorialUnskippableDuration = json['tutorial_unskippable_duration'];
    meetingUnskippableDuration = json['meeting_unskippable_duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['tutorial_video_url'] = tutorialVideoUrl;
    data['meeting_video_url'] = meetingVideoUrl;
    data['tutorial_unskippable_duration'] = tutorialUnskippableDuration;
    data['meeting_unskippable_duration'] = meetingUnskippableDuration;
    return data;
  }
}
