import 'dart:convert';

import 'package:app_padroes/constants/api_constants.dart';
import 'package:app_padroes/components/register_dialog.dart';
import 'package:app_padroes/constants/strings_constants.dart';
import 'package:app_padroes/exceptions/unexpected_exception.dart';
import 'package:app_padroes/models/user.dart';
import 'package:app_padroes/pages/homepage.dart';
import 'package:app_padroes/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void login(String email, String password) async {
    final Uri url = Uri.parse(ApiConstants.baseUrl + ApiConstants.login);

    var headers = {'Content-Type': 'application/json'};
    Map body = {'email': email.trim(), 'senha': password.trim()};
    var res = await post(url, body: jsonEncode(body), headers: headers);

    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      final SharedPreferences prefs = await _prefs;

      String token = json['token'];

      await prefs.setString('email', email.trim());
      await prefs.setString('token', token);

      Get.showSnackbar(const GetSnackBar(
        title: 'Tudo certo!',
        message: 'Logado com sucesso',
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ));
      Get.to(() => const HomePage());
    } else if (res.statusCode == 401 || res.statusCode == 404) {
      Get.showSnackbar(const GetSnackBar(
        title: 'Erro!',
        message: 'E-mail não encontrado',
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ));
    } else {
      Get.showSnackbar(const GetSnackBar(
        title: 'Erro ao fazer login!',
        message: 'Tente novamente mais tarde!',
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ));
    }
  }

  void registerUser(BuildContext context, nome, email, senha) async {
    final Uri url = Uri.parse(ApiConstants.baseUrl + ApiConstants.registerUrl);
    var headers = {'Content-Type': 'application/json'};
    Map body = {
      'nome': nome.trim(),
      'email': email.trim(),
      'senha': senha.trim()
    };
    var res = await post(url, body: jsonEncode(body), headers: headers);

    if (res.statusCode == 201) {
      // 201 = created
      Get.dialog(RegisterDialog(
        title: StringsConstants.allRight,
        message: StringsConstants.userCreated,
      ));
    } else {
      Get.dialog(
        RegisterDialog(
          title: StringsConstants.error,
          message: StringsConstants.errorMessage,
        ),
      );
    }
  }

  Future<User> userInformation() async {
    try {
      SharedPreferences prefs = await _prefs;

      String? token = prefs.getString('token');
      String? email = prefs.getString('email');

      if (email != null) {
        Uri url = Uri.parse(
            ApiConstants.baseUrl + ApiConstants.userUrl + email.toString());

        Map<String, String> headers = {
          'Authorization': 'Bearer $token',
          'Content-type': 'application/json'
        };
        var res = await post(url, headers: headers);
        prefs.setString('usuario', res.body);

        if (res.statusCode == 302) {
          final json = jsonDecode(res.body);
          User usuario = User.fromJson(json);
          return usuario;
        }
      }
    } catch (e) {
      print(e);
    }

    throw UnexpectedException();
  }

  Future<void> logout() async {
    SharedPreferences prefs = await _prefs;
    String? token = prefs.getString('accessToken');

    Uri _url = Uri.parse(ApiConstants.baseUrl + ApiConstants.logout);

    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-type': 'application/json'
    };

    await get(_url, headers: headers);
    await prefs.clear();

    Get.offAll(LoginPage());
  }
}
