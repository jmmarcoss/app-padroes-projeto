import 'package:app_padroes/components/book_card.dart';
import 'package:app_padroes/controllers/book_controller.dart';
import 'package:app_padroes/controllers/favorite_controller.dart';
import 'package:app_padroes/models/book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteBooks extends StatelessWidget {
  final FavoriteController _favoriteController = Get.find();

  FavoriteBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
      future: _favoriteController.allFavoriteBooks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Erro ao carregar os livros.'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('Nenhum livro encontrado.'),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Favoritos",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 240,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(12),
                  itemCount: snapshot.data!.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 12);
                  },
                  itemBuilder: (context, index) {
                    Book book = snapshot.data![index];
                    return BookCard(book: book);
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
