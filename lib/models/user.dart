class User {
  late String _nome;
  late String _email;
  late double _tempoMedioLeitura;

  User({
    required String nome,
    required String email,
    required double tempoMedioLeitura,
  }) {
    _nome = nome;
    _email = email;
    _tempoMedioLeitura = tempoMedioLeitura;
  }

  static User fromJson(Map<String, dynamic> json) {
    String userNome = json['nome'] as String;
    String userEmail = json['email'] as String;
    double userTempoMedioLeitura = json['tempoMedioLeitura'] as double;

    return User(
      nome: userNome,
      email: userEmail,
      tempoMedioLeitura: userTempoMedioLeitura,
    );
  }
}
