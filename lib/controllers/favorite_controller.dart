import 'dart:convert';
import 'package:app_padroes/components/favorite_dialog.dart';
import 'package:app_padroes/constants/api_constants.dart';
import 'package:app_padroes/constants/strings_constants.dart';
import 'package:app_padroes/controllers/user_controller.dart';
import 'package:app_padroes/models/book.dart';
import 'package:app_padroes/models/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteController extends GetxController {
  final Uri url = Uri.parse(ApiConstants.baseUrl + ApiConstants.favorite);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final Future<User> usuario = UserController().userInformation();

  Future<List<Book>> allFavoriteBooks() async {
    SharedPreferences prefs = await _prefs;
    String? token = prefs.getString('token');
    int? userId = prefs.getInt('userId');

    final Uri url = Uri.parse(
        "${ApiConstants.baseUrl}${ApiConstants.favorite}${ApiConstants.userUrl}$userId"); // Substitua pela URL do seu backend

    final Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final response = await get(url, headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));

      List<dynamic> livroIds =
          jsonResponse.map((book) => book["livroId"]).toList();
      List<Book> livros = livroIds.map((item) => Book.fromJson(item)).toList();
      return livros;
    } else {
      throw Exception('Falha na requisição: ${response.statusCode}');
    }
  }

  void favoriteBook(int livroId) async {
    SharedPreferences prefs = await _prefs;
    String? token = prefs.getString('token');
    int? userId = prefs.getInt('userId');

    final Uri url =
        Uri.parse("${ApiConstants.baseUrl}${ApiConstants.favorite}");

    final Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> requestBody = {
      'usuarioId': userId,
      'livroId': livroId
    };

    final response = await post(
      url,
      headers: headers,
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 201) {
      Get.dialog(const FavoriteDialog(
          title: "Tudo certo!", message: "Seu livro foi favoritado!!"));
    } else {
      Get.dialog(
        FavoriteDialog(
          title: StringsConstants.error,
          message: StringsConstants.errorMessage,
        ),
      );
    }
  }
}
