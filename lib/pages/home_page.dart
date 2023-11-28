import 'package:app_padroes/components/adventure_books.dart';
import 'package:app_padroes/components/all_books.dart';
import 'package:app_padroes/components/biografia_books.dart';
import 'package:app_padroes/components/fantasia_books.dart';
import 'package:app_padroes/components/ficcao_books.dart';
import 'package:app_padroes/components/poesia_books.dart';
import 'package:app_padroes/components/romance_books.dart';
import 'package:app_padroes/components/terror_books.dart';

import 'package:flutter/material.dart';
import 'package:app_padroes/controllers/book_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BookController _bookController = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Image(
              image: AssetImage('assets/images/PRATELEIRA.png'),
              height: 35,
              width: 35,
            ),
            SizedBox(width: 15),
            Text('Prateleira', style: TextStyle(color: Colors.black)),
          ],
        ),
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.grey[300],
      ),
      body: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Column(
            children: [
              BookListView(),
              RomanceView(),
              AventuraView(),
              BiografiaView(),
              FantasiaView(),
              FiccaoView(),
              PoesiaView(),
              TerrorView()
            ],
          ),
        ),
      ),
    );
  }
}
