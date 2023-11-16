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
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              SearchTextField(
                controller: _searchController,
                hintText: 'Buscar',
                prefixIcon: const Icon(Icons.search),
              ),
            ],
          ),
        )));
  }
}
