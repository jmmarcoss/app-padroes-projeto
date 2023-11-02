import 'dart:convert';

import 'package:app_padroes/constants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final Uri _url = Uri.parse(ApiConstants.baseUrl + ApiConstants.login);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void login(String email, String password) async {
    var headers = {'Content-Type': 'application/json'};
    Map body = {'email': email.trim(), 'senha': password.trim()};
    var res = await post(_url, body: jsonEncode(body), headers: headers);

    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      final SharedPreferences prefs = await _prefs;

      String token = json['token'];
      await prefs.setString('token', token);

      debugPrint(token);

      Get.showSnackbar(const GetSnackBar(
        title: 'Tudo certo!',
        message: 'Logado com sucesso',
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ));
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
}
