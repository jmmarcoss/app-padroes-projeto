class ReadingBook {
  late int _id;
  late int _idUsuario;
  late int _idLivro;
  late DateTime _data_inicio_de_leitura;
  late DateTime _data_termino_de_leitura;

  ReadingBook({
    int? id,
    required int idUsuario,
    required int idLivro,
  }) {
    _id = id!;
    _idUsuario = idUsuario;
    _idLivro = idLivro;
  }

  static ReadingBook fromJson(Map<String, dynamic> json) {
    return ReadingBook(
      id: json['id'],
      idUsuario: json['usuario_id'],
      idLivro: json['livro_id'],
    );
  }

  int get getId {
    return _id;
  }

  int get getUsuarioId {
    return _idUsuario;
  }

  int get getCategoria {
    return _idLivro;
  }
}
