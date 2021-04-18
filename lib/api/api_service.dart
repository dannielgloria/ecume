import 'package:ecume/model/login_model.dart';
import 'package:ecume/model/recoverPwd_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  String authority = "ecume.herokuapp.com";
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String unencodedPath = "/apiECUME/login";
    final response = await http.post(Uri.https(authority, unencodedPath),
        body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Data');
    }
  }

  Future<RecoverPwdResponseModel> recoverPwd(
      RecoverPwdRequestModel requestModel) async {
    String unencodedPath = "/apiECUME/login";
    final response = await http.post(Uri.https(authority, unencodedPath),
        body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return RecoverPwdResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
