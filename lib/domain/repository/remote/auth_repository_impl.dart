import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:study_hub/common/constants.dart';
import 'package:study_hub/model/models/resource.dart';
import 'package:study_hub/model/models/tokens.dart';
import 'package:study_hub/model/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  static const headers = {"Content-Type": "application/json"};
  var getStorage = GetStorage();

  @override
  Future<Resource<Token>> register({
    required String email,
    required String password,
    required String fullName,
  }) async {
    var url = Uri.parse("$serverIP/user/register/");

    var body = json
        .encode({"email": email, "fullname": fullName, "password": password});

    http.Response response;
    try {
      response = await http.post(headers: headers, url, body: body);
    } catch (e) {
      return Fail(errorMessage: e.toString());
    }
    int statusCode = response.statusCode;

    if (statusCode == registerSuccessCode) {
      var token = Token.fromJson(json.decode(response.body));
      getStorage.write("access", token.accessToken);
      getStorage.write("refresh", token.refreshToken);
      return Success(successData: token);
    } else {
      if (statusCode == registerCredentialsAlreadyExistCode) {
        String message = "User with such email already exists";
        return Fail(errorMessage: message, statusCode: statusCode);
      } else {
        return Fail(errorMessage: "Unexpected error", statusCode: statusCode);
      }
    }
  }

  @override
  Future<Resource<Token>> login(
      {required String email, required String password}) async {
    var url = Uri.parse("$serverIP/user/login/");

    var body = json.encode({"email": email, "password": password});

    http.Response response;

    try {
      response = await http.post(url, headers: headers, body: body);
    } catch (e) {
      return Fail(errorMessage: e.toString());
    }
    int statusCode = response.statusCode;

    if (statusCode == loginSuccessCode) {
      var token = Token.fromJson(json.decode(response.body));
      getStorage.write("access", token.accessToken);
      getStorage.write("refresh", token.refreshToken);
      return Success(successData: token);
    } else {
      if (statusCode == loginWrongCredentialsCode) {
        return Fail(errorMessage: "Wrong email or password");
      } else {
        return Fail(errorMessage: "Unexpected error", statusCode: statusCode);
      }
    }
  }

  @override
  Resource<int> logout() {
    try {
      getStorage.erase();
      return Success(successData: 1);
    } catch (e) {
      return Fail(errorMessage: e.toString());
    }
  }
}