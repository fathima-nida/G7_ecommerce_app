class ApiEndpoints {
  static const baseUrl = 'http://3.109.147.140:3045';

  // Authentication
  static const String login = '/ecommerce-login';
  static String otp(String otp) => 'verify-otp?OtpCode=$otp';
}
