import '../../../core/constansts/icon_manager.dart';

class LeadActivityModel {
  final String number;
  final String title;
  final String icon;

  LeadActivityModel({
    required this.number,
    required this.title,
    required this.icon,
  });
}

List<LeadActivityModel> leadActivityList = [
  LeadActivityModel(
    number: "6",
    title: "Lead Submitted",
    icon: IconManager.file,
  ),
  LeadActivityModel(
    number: "4",
    title: "Qualified Leads",
    icon: IconManager.qualified,
  ),
  LeadActivityModel(
    number: "6",
    title: "Conversation",
    icon: IconManager.sheet,
  ),
];
