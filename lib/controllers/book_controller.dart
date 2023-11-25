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

  Future<List<Book>> allBooks() async {
    try {
      SharedPreferences prefs = await _prefs;
      String? token = prefs.getString('token');
      Uri url = Uri.parse(ApiConstants.baseUrl + ApiConstants.book);

      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json',
      };

      var response = await get(url, headers: headers);

      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(utf8.decode(response.bodyBytes));

        List<Book> books = jsonList.map((jsonBook) {
          return Book.fromJson(jsonBook);
        }).toList();

        return books;
      } else {
        // Handle other status codes if needed
        throw Exception('Failed to load books');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
      throw UnexpectedException();
    }
  }
}
