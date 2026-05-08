class ApiEndpoints {
  static const String baseUrl =
      "https://limiting-zones-ability-costume.trycloudflare.com/api";
  static const String users = 'auth/register';
   static const String login = 'auth/login';
  static const String switchRole = 'auth/switch-role';
  static const String verifyMail = 'auth/verify-email';
  static const String resendOtp = 'auth/resend-verification-email';
  static const String loadUser = 'auth/me';
  static const String updateProfile = 'auth/update-profile';
  static const String forgetPassword = 'auth/forgot-password';
  static const String createAndagetJob = 'jobs';
}
