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
 static const String secNewarrival = "/section-wise-items";
 static const String banner ="/banner-list"; 
 static const String categoryList="/category-list";
 static const String getcart='/get-ecommerce-cart';
 static const String updatequantity='update-ecommerce-po-cart-qty';
  static const String searchProducts="/ecommerce-search-products";

 
//favourie
   static const String favourite = "/get-ecommerce-wishlist";
   //product view
    static const String productDetails = "/ecommerce-product-details";
   static const String addToCart="/ecommerce-wishlist";
   //category screen
   static const String categoryName="/ecommerce-search-category";
   static const String categoryId="/ecommerce-products-by-category/{categoryId}";
}
