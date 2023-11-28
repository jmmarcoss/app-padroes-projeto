import 'package:app_padroes/components/all_books.dart';
import 'package:app_padroes/components/book_card.dart';
import 'package:app_padroes/pages/book_detail_page.dart';
import 'package:app_padroes/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:app_padroes/controllers/book_controller.dart';
import 'package:app_padroes/models/book.dart';
import 'package:get/get.dart';

class LibraryPage extends StatefulWidget {
  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
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
        body: BookListView(),
      ),
    );
  }
}
