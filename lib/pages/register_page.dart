import 'package:app_padroes/components/my_button.dart';
import 'package:app_padroes/components/my_textfield_email.dart';
import 'package:app_padroes/components/my_textfield_password.dart';
import 'package:app_padroes/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nomeController = TextEditingController();

  late String email;
  late String senha;
  late String nome;

  bool _senhaVisivel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      // Barra do App
      appBar: AppBar(
        title: const Text(
          "Cadastro",
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
              "Seja bem-vindo!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),

            // Espaçamento entre os textos
            const SizedBox(height: 10),

            // Text "Digite seu e-mail" abaixo do cadeado
            const Text(
              "Ficamos felizes em tê-lo conosco.",
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
              prefixIcon: const Icon(Icons.mail),
            ),
            const SizedBox(height: 10),
            //Password
            PasswordTextField(
              controller: _passwordController,
              hintText: 'Senha',
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: GestureDetector(
                child: Icon(
                    _senhaVisivel == false
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey[500]),
                onTap: () {
                  setState(() {
                    _senhaVisivel = !_senhaVisivel;
                  });
                },
              ),
              obscureText: !_senhaVisivel,
            ),
            // Separador
            const SizedBox(height: 30),

            // Botão
            MyButton(
              onTap: () async {
                RegisterController().registerUser(
                  context,
                  _nomeController.text,
                  _emailController.text,
                  _passwordController.text,
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
