import 'package:app_padroes/controllers/user_controller.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final Map<String, dynamic>? _usuario =
      UserController().getUsuario() as Map<String, dynamic>?;

  @override
  Widget build(BuildContext context) {
    if (_usuario == null) {
      return const Center(child: CircularProgressIndicator());
    }
    final name = _usuario!['name'];
    final email = _usuario!['email'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text(email, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
