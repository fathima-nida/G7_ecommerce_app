import 'package:g7_comerce_app/core/constants/pref_resources.dart';
import 'package:g7_comerce_app/utils/App_storage.dart';

class SharedPrefHelper {
  static Future<void> saveBaseUrl(String url) async {
    await AppStorage.setString(PrefResources.BASEURL, url);
  }

  static Future<String?> getBaseUrl() async {
    return AppStorage.getString(PrefResources.BASEURL);
  }

  static Future<void> saveAppToken(String token) async {
    await AppStorage.setString(PrefResources.TOKENAPP, token);
  }

  static Future<String?> getAppToken() async {
    return AppStorage.getString(PrefResources.TOKENAPP);
  }

 
  static Future<void> clearAppToken() async {
    await AppStorage.remove(PrefResources.TOKENAPP);
  }

  static Future<void> clearAll() async {
    await AppStorage.clearAll();  
  }


  
  static Future<void> saveLedgerId(String ledgerId) async {
  await AppStorage.setString(PrefResources.LEDGER_ID, ledgerId);
}

static Future<String?> getLedgerId() async {
  return AppStorage.getString(PrefResources.LEDGER_ID);
}

  static Future<void> clearLedgerId() async {
    await AppStorage.remove(PrefResources.LEDGER_ID);
  }


}