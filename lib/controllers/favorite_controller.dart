import 'dart:convert';

import 'package:app_padroes/constants/api_constants.dart';
import 'package:app_padroes/exceptions/unexpected_exception.dart';
import 'package:app_padroes/models/book.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteController extends GetxController {
  final Uri url = Uri.parse(ApiConstants.baseUrl + ApiConstants.favorite);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<List<Book>> allBooks(int livroId) async {
    try {
      SharedPreferences prefs = await _prefs;
      String? token = prefs.getString('token');
      int? usuarioId = prefs.getInt('id');

      Map body = {'usuarioId': usuarioId, 'livroId': livroId};

      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json',
      };

      var response = await post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 201) {
        final json = jsonDecode(response.body);

        final jsonLivro = json['livroId'];
        List<Book> books = jsonLivro.map((jsonBook) {
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
