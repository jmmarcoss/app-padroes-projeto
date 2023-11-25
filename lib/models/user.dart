class User {
  late int _id;
  late String _nome;
  late String _email;
  // late double _tempo_medio_por_pagina;
  // late double _tempo_total_de_leitura;

  User({
    required id,
    required nome,
    required email,
    // required tempo_medio_por_pagina,
    // required tempo_total_de_leitura,
  }) {
    this._id = id;
    this._nome = nome;
    this._email = email;
    // this._tempo_medio_por_pagina = tempo_medio_por_pagina;
//this._tempo_total_de_leitura = tempo_total_de_leitura;
  }

  static User fromJson(Map<String, dynamic> json) {
    int id = json['id'] as int;
    String nome = json['nome'] as String;
    String email = json['email'] as String;
    // double tempo_medio_por_pagina = json['tempo_medio_por_pagina'] as double;
    // double tempo_total_de_leitura = json['tempo_total_de_leitura'] as double;

    return User(
      id: id,
      nome: nome,
      email: email,
    );
    //  tempo_medio_por_pagina: tempo_medio_por_pagina,
    //  tempo_total_de_leitura: tempo_total_de_leitura);
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

  // double get getTempoMedioPagina {
  //   return this._tempo_medio_por_pagina;
  // }

  // double get getTempoMedioLeitura {
  //   return this._tempo_total_de_leitura;
  // }
}
