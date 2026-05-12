class ApiEndpoints {
  static const String baseUrl =
      "https://count-compare-always-christina.trycloudflare.com/api";
  static const String users = 'auth/register';
   static const String login = 'auth/login';
  static const String user = 'auth/me';
  static const String leads = 'leads';
  static const String leadsAll = 'leads/all';
  static const String trades = 'trades';
  static String leadActivity({required String startDate, required String endDate}) =>
    'leads/lead-activity?startDate=$startDate&endDate=$endDate';
  static const String connectionRequestUserList = 'connection-requests/user/list';
  static String connectionRequestDetail({required String id}) => 'connection-requests/$id';
  static String connectionRequestStatus({required String id}) => 'connection-requests/$id/status';
  static const String createAndagetJob = 'jobs';
  static const String notifications = 'admin/notification';
  static const String giftcardStatus = 'giftcard/user-wise-gift';
  static const String supportRequest = 'support/request';
  static const String watchVideo = 'onboarding';
}
