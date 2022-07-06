import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/cupertino.dart';

import '../../model/loginmodel/login_response_model.dart';
import '../../view/sign_in_view.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist('login_details');
    return isKeyExist;
  }

  static Future<LoginResponseModel?> loginDetails() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist('login_details');
    if (isKeyExist) {
      var chachData = await APICacheManager().getCacheData('login_details');
      return loginResponseJson(chachData.syncData);
    }
    return null;
  }

  static Future<void> setLoginDetails(LoginResponseModel model) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
        key: 'login_details', syncData: jsonEncode(model.toJson()));
    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache('login_details');
    Navigator.pushNamedAndRemoveUntil(
        context, SignInView.routeName, (route) => false);
  }
}
