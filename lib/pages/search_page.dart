import 'package:flutter/material.dart';
import 'package:app_padroes/components/my_textfield_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Procure por um livro",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 20),
            SearchTextField(
                controller: _searchController,
                hintText: "Buscar",
                prefixIcon: const Icon(Icons.search))
          ],
        ),
      ),
    );
  }
}
