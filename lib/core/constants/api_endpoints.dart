class ApiEndpoints {
  static const baseUrl = 'http://3.109.147.140:3045';

  // Authentication
  static const String login = '/ecommerce-login';
  static String verifyOtp = '/verify-otp';
 

  // Dashboard
  static const String dashboard = '/get-ecommerce-dashboard';
  //home
  static const String secNewarrival="/section-wise-items/{sectionName}";
//favourie
   static const String favourite = "/get-ecommerce-wishlist ";
   //product view
    static const String productDetails = "/ecommerce-product-details/{productId} ";
   
}
