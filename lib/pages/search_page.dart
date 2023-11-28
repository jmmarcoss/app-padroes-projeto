import 'package:app_padroes/components/my_textfield_search.dart';
import 'package:app_padroes/controllers/book_controller.dart';
import 'package:app_padroes/models/book.dart';
import 'package:app_padroes/pages/book_detail_page.dart';
import 'package:flutter/material.dart'; // Importe a tela de detalhes do livro

class PesquisaLivrosScreen extends StatefulWidget {
  @override
  _PesquisaLivrosScreenState createState() => _PesquisaLivrosScreenState();
}

class _PesquisaLivrosScreenState extends State<PesquisaLivrosScreen> {
  final _bookController = BookController();
  final TextEditingController _searchController = TextEditingController();
  List<Book> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Row(
          children: [
            Image(
              image: AssetImage('assets/images/PRATELEIRA.png'),
              height: 35,
              width: 35,
            ),
            SizedBox(width: 15),
            Text('Pesquisar Livros', style: TextStyle(color: Colors.black)),
          ],
        ),
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.grey[300],
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0),
            child: SearchTextField(
                controller: _searchController,
                hintText: "Buscar",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _performSearch();
                  },
                )),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: _buildSearchResults(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    if (_searchResults.isEmpty) {
      return Center(
        child: Text('Nenhum resultado encontrado.'),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          itemCount: _searchResults.length,
          itemBuilder: (context, index) {
            Book livro = _searchResults[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    _navigateToBookDetailScreen(livro);
                  },
                  leading: Image.network(
                    livro
                        .getUrlImg, // Suponha que sua classe Livro tenha um campo urlImagem para a capa
                    height: 40.0, // Ajuste conforme necessário
                    width: 28.0, // Ajuste conforme necessário
                    fit: BoxFit.cover,
                  ),
                  title: Text(livro.getTitulo),
                  // Adicione outros detalhes conforme necessário
                ),
              ),
            );
          },
        ),
      );
    }
  }

  void _performSearch() async {
    String titulo = _searchController.text.trim();

    if (titulo.isNotEmpty) {
      try {
        List<Book> results = await _bookController.findByTitulo(titulo);

        setState(() {
          _searchResults = results;
        });
      } catch (e) {
        // Trate exceções conforme necessário
        print('Erro na pesquisa de livros: $e');
      }
    } else {
      setState(() {
        _searchResults = [];
      });
    }
  }

  void _navigateToBookDetailScreen(Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailScreen(book: book),
      ),
    );
  }
}
