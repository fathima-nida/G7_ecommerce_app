import 'package:g7_comerce_app/core/build_config/app_env.dart';

class BuildConfig {
  static late final AppEnv environment;
  static late final String baseUrl;
  static String? appToken;
  static late final Duration timeOut;
  static late final bool isDeveloperWindowEnabled;

  static Future<void> initialize({
    required AppEnv environment,
    required String baseUrl,
    Duration timeOut = const Duration(seconds: 15),
    required bool isDeveloperWindowEnabled,
  }) async {
    BuildConfig.environment = environment;
    BuildConfig.baseUrl = baseUrl;
    BuildConfig.timeOut = timeOut;
    BuildConfig.isDeveloperWindowEnabled = isDeveloperWindowEnabled;

    await UpdateAppToken();
  }

  static Future<void> UpdateAppToken({String? token}) async {
    if (token != null) {
      BuildConfig.appToken = token;
      await share
    }
  }
}
