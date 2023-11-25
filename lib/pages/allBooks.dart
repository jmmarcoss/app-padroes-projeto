import 'package:app_padroes/models/book.dart';
import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  const BookDetailScreen({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.getTitulo),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              book.getUrlImg,
              height: 300.0,
              width: 210.0,
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
            )
            // Adicione mais informações conforme necessário
          ],
        ),
      ),
    );
  }
}
