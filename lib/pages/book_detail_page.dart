import 'package:app_padroes/components/my_button.dart';
import 'package:app_padroes/components/read_button.dart';
import 'package:app_padroes/controllers/favorite_controller.dart';
import 'package:app_padroes/models/book.dart';
import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  const BookDetailScreen({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey[300],
        title: Text(
          book.getTitulo,
          style: const TextStyle(
            color: Colors.black, // Change the color here
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Image.network(
                book.getUrlImg,
                height: 250.0,
                width: 175.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20.0),
              Text('Autor: ${book.getAutor}'),
              Text('Categoria: ${book.getCategoria}'),
              Text('Data de Publicação: ${book.getDataDePublicacao}'),
              Text('Número de Páginas: ${book.getPaginas}'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text('Descrição: ${book.getDescricao}'),
              ),
              const SizedBox(height: 20.0),
              MyButton(
                  onTap: () async {
                    FavoriteController().favoriteBook(book.getId);
                  },
                  texto: "Favoritar",
                  color: Colors.black),
              SizedBox(height: 75),
              BotaoLeitura(livroId: book.getId)
              // Adicione mais informações conforme necessário
            ],
          ),
        ),
      ),
    );
  }
}
