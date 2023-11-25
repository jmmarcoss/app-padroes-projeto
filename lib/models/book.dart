class Book {
  late int _id;
  late String _autor;
  late String _categoria;
  late DateTime _dataDePublicacao;
  late int _paginas;
  late String _titulo;
  late String _urlImg;

  Book(
      {required id,
      required String autor,
      required String categoria,
      required DateTime dataDePublicacao,
      required int paginas,
      required String titulo,
      required String urlImg}) {
    _id = id!;
    _autor = autor;
    _categoria = categoria;
    _dataDePublicacao = dataDePublicacao;
    _paginas = paginas;
    _titulo = titulo;
    _urlImg = urlImg;
  }

  static Book fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      titulo: json['titulo'],
      autor: json['autor'],
      categoria: json['categoria'],
      paginas: json['paginas'],
      dataDePublicacao: DateTime.parse(json['dataDePublicacao']),
      urlImg: json['urlImg'],
    );
  }

  int get getId {
    return _id;
  }

  String get getAutor {
    return _autor;
  }

  String get getCategoria {
    return _categoria;
  }

  DateTime get getDataDePublicacao {
    return _dataDePublicacao;
  }

  int get getPaginas {
    return _paginas;
  }

  String get getTitulo {
    return _titulo;
  }

  String get getUrlImg {
    return _urlImg;
  }
}
