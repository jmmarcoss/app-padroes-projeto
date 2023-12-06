import 'package:app_padroes/components/register_dialog.dart';
import 'package:app_padroes/components/time_dialog.dart';
import 'package:app_padroes/constants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class BotaoLeitura extends StatefulWidget {
  final int livroId;

  const BotaoLeitura({Key? key, required this.livroId}) : super(key: key);

  @override
  _BotaoLeituraState createState() => _BotaoLeituraState();
}

class _BotaoLeituraState extends State<BotaoLeitura> {
  bool iniciouLeitura = false;
  DateTime? inicioLeitura;
  DateTime? fimLeitura;
  int quantidadePaginas = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!iniciouLeitura) {
          setState(() {
            iniciouLeitura = true;
            inicioLeitura = DateTime.now().toUtc().subtract(Duration(hours: 3));
          });
        } else {
          // Finalizou a leitura
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Quantidade de Páginas Lidas'),
                content: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    quantidadePaginas = int.parse(value);
                  },
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () async {
                      Navigator.of(context).pop(); // Fechar o diálogo

                      fimLeitura =
                          DateTime.now().toUtc().subtract(Duration(hours: 3));

                      // Enviar requisição HTTP
                      await enviarLeitura();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Text(iniciouLeitura ? 'Finalizar Leitura' : 'Iniciar Leitura'),
    );
  }

  Future<void> enviarLeitura() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    int? userId = prefs.getInt('userId');

    final Uri url = Uri.parse(
        "${ApiConstants.baseUrl}/lendo"); // Substitua pela URL do seu backend

    final Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> requestBody = {
      'usuarioId': userId,
      'livroId': widget.livroId,
      'dataInicioDeLeitura': inicioLeitura!.toIso8601String(),
      'dataTerminoDeLeitura': fimLeitura!.toIso8601String(),
      'minutos': fimLeitura!.difference(inicioLeitura!).inMinutes,
      'qntDePaginas': quantidadePaginas,
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 201) {
        Get.dialog(const TimeDialog(
            title: "Tudo certo", message: "Sua leitura foi salva!"));
      } else {
        print(
            'Falha ao enviar a requisição. Código de resposta: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro durante a requisição: $e');
    }
  }
}
