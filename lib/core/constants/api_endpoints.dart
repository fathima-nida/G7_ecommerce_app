class ApiEndpoints {
  static const baseUrl = 'http://3.109.147.140:3045';

  // Authentication
  static const String login = '/ecommerce-login';
  static String verifyOtp = '/verify-otp';

  // Dashboard
  static const String dashboard = '/get-ecommerce-dashboard';
   static const String salesOrders = '/get-ecommerce-sales-orders';
  static const String orderView = '/get-checkout';

  
  //home
 static const String secNewarrival = "/section-wise-items/{sectionName}";
 static const String banner ="/banner-list";
 static const String categoryList="/category-list";
  static const String searchProducts="/ecommerce-search-products/{name}";

 
}
