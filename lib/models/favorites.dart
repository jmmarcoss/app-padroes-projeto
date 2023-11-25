class FavoriteBook {
  late int _id;
  late int _idUsuario;
  late int _idLivro;

  FavoriteBook({
    int? id,
    required int idUsuario,
    required int idLivro,
  }) {
    _id = id!;
    _idUsuario = idUsuario;
    _idLivro = idLivro;
  }

  static FavoriteBook fromJson(Map<String, dynamic> json) {
    return FavoriteBook(
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
