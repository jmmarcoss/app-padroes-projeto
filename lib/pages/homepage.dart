import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      // Barra do App
      appBar: AppBar(
        title: const Text(
          "HomePage",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),

      // Conteúdo da Tela, com Scroll
      body: const SingleChildScrollView(
        padding: EdgeInsets.only(top: 50.0),

        // color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/PRATELEIRA.png'),
                height: 200,
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
