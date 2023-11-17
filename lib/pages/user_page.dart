import 'package:app_padroes/controllers/user_controller.dart';
import 'package:app_padroes/models/user.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final Future<User> _usuario = UserController().userInformation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User>(
          future: _usuario,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // Exibir as informações do usuário
              return ListTile(
                title: Text(snapshot.data!.nome),
                subtitle: Text(snapshot.data!.email),
              );
            } else if (snapshot.hasError) {
              // Exibir o erro
              return Text("snapshot.error");
            } else {
              // Exibir um spinner
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
