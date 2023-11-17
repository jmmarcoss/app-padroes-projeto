class User {
  late int id;
  late String nome;
  late String email;

  User({
    required id,
    required nome,
    required email,
  }) {
    nome = nome;
    email = email;
  }

  static User fromJson(Map<String, dynamic> json) {
    int id = json['id'] as int;
    String nome = json['nome'] as String;
    String email = json['email'] as String;

    return User(id: id, nome: nome, email: email);
  }

  String get getNome {
    return nome;
  }

  String get getEmail {
    return email;
  }
}
