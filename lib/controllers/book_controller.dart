import 'dart:convert';

import 'package:app_padroes/components/register_dialog.dart';
import 'package:app_padroes/constants/api_constants.dart';
import 'package:app_padroes/constants/strings_constants.dart';
import 'package:app_padroes/exceptions/unexpected_exception.dart';
import 'package:app_padroes/models/book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookController extends GetxController {
  final Uri _url = Uri.parse(ApiConstants.baseUrl + ApiConstants.book);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void registerUser(BuildContext context, nome, email, senha) async {
    var headers = {'Content-Type': 'application/json'};
    Map body = {
      'nome': nome.trim(),
      'email': email.trim(),
      'senha': senha.trim()
    };
    var res = await post(_url, body: jsonEncode(body), headers: headers);

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

  Future<List<Book>> allBooks() async {
    try {
      SharedPreferences prefs = await _prefs;

      String? token = prefs.getString('token');
      Uri url = Uri.parse(ApiConstants.baseUrl + ApiConstants.book);

      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json'
      };
      var res = await get(url, headers: headers);

      if (res.statusCode == 200) {
        List<Book> livros = jsonDecode(res.body).map((livro) {
          return Book.fromJson(livro);
        }).toList();

        return livros;
      }
    } catch (e) {}

    throw UnexpectedException();
  }
}
