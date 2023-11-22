class User {
  late int _id;
  late String _nome;
  late String _email;

  User({
    required id,
    required nome,
    required email,
  }) {
    this._id = id;
    this._nome = nome;
    this._email = email;
  }

  static User fromJson(Map<String, dynamic> json) {
    int id = json['id'] as int;
    String nome = json['nome'] as String;
    String email = json['email'] as String;

    return User(id: id, nome: nome, email: email);
  }

  int get getId {
    return this._id;
  }

  String get getNome {
    return this._nome;
  }

  String get getEmail {
    return this._email;
  }
}
