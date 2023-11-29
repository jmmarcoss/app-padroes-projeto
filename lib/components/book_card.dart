import 'package:app_padroes/models/book.dart';
import 'package:app_padroes/pages/book_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          // Navegar para a tela de detalhes do livro quando o Card for clicado
          Get.to(() => BookDetailScreen(book: book));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.grey[200]),
          width: 150,
          height: 200,
          child: Column(
            children: [
              const SizedBox(height: 15),
              Image.network(book.getUrlImg, width: 150, height: 105),
              ListTile(
                title: Text(book.getTitulo, textAlign: TextAlign.center),
                subtitle: Text(book.getAutor, textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      );
}
