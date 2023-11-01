import 'package:app_padroes/components/my_button.dart';
import 'package:app_padroes/components/my_textfield_email.dart';
import 'package:app_padroes/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

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
                MyTextField(
                  controller: usernameController,
                  hintText: 'E-mail',
                  obscureText: false,
                  prefixIcon: const Icon(Icons.person),
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Senha',
                  obscureText: true,
                  prefixIcon: const Icon(Icons.lock),
                ),

                const SizedBox(height: 30),

                // sign in button
                MyButton(
                  onTap: signUserIn,
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
                          Get.to(RegisterPage());
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
