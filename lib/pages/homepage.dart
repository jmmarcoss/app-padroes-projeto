// ignore_for_file: must_be_immutable

import 'package:app_padroes/components/my_button.dart';
import 'package:app_padroes/components/my_textfield_email.dart';
import 'package:app_padroes/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _nomeController = TextEditingController();
  late String email;
  late String senha;
  late String nome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      // Barra do App
      appBar: AppBar(
        title: const Text(
          "HomePage bolada",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),

      // Conteúdo da Tela, com Scroll
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 50.0),

        // color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "cadastro blabla",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),

            // Espaçamento entre os textos
            const SizedBox(height: 15),

            // Text "Digite seu e-mail" abaixo do cadeado
            const Text(
              "Digite seu email",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),

            // Espaçamento Text e TextField
            const SizedBox(height: 25),

            // TextField do Redefinir Senha
            EmailTextField(
              controller: _nomeController,
              hintText: 'Nome',
              obscureText: false,
              prefixIcon: const Icon(Icons.person),
            ),
            const SizedBox(height: 10),
            EmailTextField(
              controller: _emailController,
              hintText: 'E-mail',
              obscureText: false,
              prefixIcon: const Icon(Icons.person),
            ),
            const SizedBox(height: 10),
            //Password
            EmailTextField(
              controller: _senhaController,
              hintText: "Senha",
              obscureText: true,
              prefixIcon: const Icon(Icons.visibility_outlined),
            ),

            // Separador
            const SizedBox(height: 20),

            // Botão
            MyButton(
              onTap: () async {
                Register().registerUser(
                  context,
                  _nomeController.text,
                  _emailController.text,
                  _senhaController.text,
                );
              },
              texto: "Registrar",
            ),
          ],
        ),
      ),
    );
  }
}
