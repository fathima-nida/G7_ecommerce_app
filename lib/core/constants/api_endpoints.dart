class ApiEndpoints {
  static const baseUrl = 'http://3.109.147.140:3045';

  // Authentication
  static const String login = '/ecommerce-login';
  static String verifyOtp = '/verify-otp?OtpCode';
 

  // Dashboard
  static const String dashboard = '/get-ecommerce-dashboard';
}
