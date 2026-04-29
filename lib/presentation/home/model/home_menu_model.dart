import '../../../core/constansts/icon_manager.dart';

class HomeMenuModel {
  final String title;
  final String subtitle;
  final String icon;
  final bool? isSelected;

  HomeMenuModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.isSelected,
  });
}

List<HomeMenuModel> homeMenuList = [
  HomeMenuModel(
    title: "Add New Lead",
    subtitle: "Submit leads here",
    icon: IconManager.task,
    isSelected: true,
  ),
  HomeMenuModel(
    title: "Lead Activity",
    subtitle: "See all activities",
    icon: IconManager.target,
    isSelected: true,
  ),
  HomeMenuModel(
    title: "Connection Request",
    subtitle: "Send Connection",
    icon: IconManager.userAdd,
    isSelected: true,
  ),
  HomeMenuModel(
    title: "Watch Videos",
    subtitle: "Watch Instruction Videos",
    icon: IconManager.videoPlay,
    isSelected: true,
  ),
];
