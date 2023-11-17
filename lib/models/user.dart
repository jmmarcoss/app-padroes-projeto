class User {
  late int _id;
  late String _nome;
  late String _email;
  late double _tempoMedioLeitura;

  User({
    int? id,
    required String nome,
    required String email,
    double? tempoMedioLeitura,
  }) {
    _id = id!;
    _nome = nome;
    _email = email;
    _tempoMedioLeitura = tempoMedioLeitura!;
  }

  static User fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        nome: json['nome'],
        email: json['email'],
        tempoMedioLeitura: json['tempoMedioLeitura']);
  }

  int get getId {
    return _id;
  }

  String get getNome {
    return _nome;
  }

  String get getEmail {
    return _email;
  }

  double get getTempoMedioLeitura {
    return _tempoMedioLeitura;
  }
}
