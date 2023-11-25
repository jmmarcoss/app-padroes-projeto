import 'package:app_padroes/pages/allBooks.dart';
import 'package:flutter/material.dart';
import 'package:app_padroes/controllers/book_controller.dart';
import 'package:app_padroes/models/book.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final BookController _bookController = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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

class BookListView extends StatelessWidget {
  final BookController _bookController = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
      future: _bookController.allBooks(),
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
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Book book = snapshot.data![index];
              return GestureDetector(
                onTap: () {
                  // Navegar para a tela de detalhes do livro quando o Card for clicado
                  Get.to(() => BookDetailScreen(book: book));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    // Ou outro widget de container, dependendo do seu design
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.network(
                            book.getUrlImg,
                            height: 100.0, // Ajuste conforme necessário
                            width: 70.0, // Ajuste conforme necessário
                            fit: BoxFit
                                .cover, // Pode ajustar o modo de ajuste conforme necessário
                          ),
                          ListTile(
                            title: Text(book.getTitulo),
                            subtitle: Text(book.getAutor),
                            // Pode adicionar mais detalhes conforme necessário
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
