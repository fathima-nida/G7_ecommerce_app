class ApiEndpoints {
  static const baseUrl = 'http://3.109.147.140:3045/';

  // Authentication
  static String login(String mobileNo) => 'ecommerce-login?MobileNo=$mobileNo';
  static String otp(String otp) => 'verify-otp?OtpCode=$otp';
}
