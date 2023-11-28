import 'package:app_padroes/components/book_card.dart';
import 'package:app_padroes/pages/book_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:app_padroes/controllers/book_controller.dart';
import 'package:app_padroes/models/book.dart';
import 'package:get/get.dart';

class LibraryPage extends StatefulWidget {
  @override
  State<LibraryPage> createState() => _BookListViewState();
}

class _BookListViewState extends State<LibraryPage> {
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Todos os livros",
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

  // Widget buildBookCard(Book book) => GestureDetector(
  //       onTap: () {
  //         // Navegar para a tela de detalhes do livro quando o Card for clicado
  //         Get.to(() => BookDetailScreen(book: book));
  //       },
  //       child: Container(
  //         color: Colors.green[300],
  //         width: 150,
  //         height: 200,
  //         child: Column(
  //           children: [
  //             SizedBox(height: 15),
  //             Image.network(book.getUrlImg, width: 150, height: 105),
  //             ListTile(
  //               title: Text(book.getTitulo, textAlign: TextAlign.center),
  //               subtitle: Text(book.getAutor, textAlign: TextAlign.center),
  //               // Pode adicionar mais detalhes conforme necessário
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
}
