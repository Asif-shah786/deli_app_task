import 'dart:convert';
import 'package:deli_sol_task/services/account/shared_service.dart';
import 'package:http/http.dart' as http;
import '../../model/loginmodel/login_request_model.dart';
import '../../model/loginmodel/login_response_model.dart';
import '../../model/signupmodel/signup_request_model.dart';
import '../../model/signupmodel/signup_response_model.dart';
import '../utilities/api_url.dart';

class ApiService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeader = {'Content-type': 'application/json'};
    var url = Uri.http(ApiUrl.apiUrl, ApiUrl.loginApi);

    var response = await client.post(url,
        headers: requestHeader, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      //deal with data
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      return true;
    } else {
      return false;
    }
  }

  static Future<SignupResponseModel> register(SignupRequestModel model) async {
    Map<String, String> requestHeader = {'Content-type': 'application/json'};
    var url = Uri.http(ApiUrl.apiUrl, ApiUrl.registerApi);

    var response = await client.post(url,
        headers: requestHeader, body: jsonEncode(model.toJson()));

    return SignupResponseModel(response.body);
  }
}
