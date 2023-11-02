import 'package:app_padroes/components/my_button.dart';
import 'package:app_padroes/components/my_textfield_email.dart';
import 'package:app_padroes/components/my_textfield_password.dart';
import 'package:app_padroes/constants/strings_constants.dart';
import 'package:app_padroes/controllers/login_controller.dart';
import 'package:app_padroes/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _senhaVisivel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                const Image(
                  image: AssetImage('assets/images/PRATELEIRA.png'),
                  height: 200,
                  width: 200,
                ),

                const SizedBox(height: 50),

                // username textfield
                EmailTextField(
                  controller: _emailController,
                  hintText: 'E-mail',
                  obscureText: false,
                  prefixIcon: const Icon(Icons.person),
                ),

                const SizedBox(height: 10),

                // password textfield
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

                const SizedBox(height: 30),

                // sign in button
                MyButton(
                  onTap: () async {
                    LoginController()
                        .login(_emailController.text, _passwordController.text);
                  },
                  texto: StringsConstants.buttonSignIn,
                ),

                const SizedBox(height: 10),

                // Não é cadastrado? Registre-se agora
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Não é cadastrado?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => RegisterPage());
                        },
                        child: const Text(
                          'Registre-se agora',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
