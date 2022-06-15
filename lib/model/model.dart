//import 'dart:html';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';

const String tableSaude = 'saude';

class UserFields {
  static final List<String> values = [id, nome, idade, imagem];

  static const String id = '_id';
  static const String nome = 'nome';
  static const String idade = 'idade';
  static const String imagem = 'imagem';
}

class User {
  final int? id;
  String? nome;
  int? idade;
  Uint8List? imagem;

  User({this.id, this.nome, this.idade, this.imagem});

  Map<String, Object?> toJson() => {
        UserFields.id: id,
        UserFields.nome: nome,
        UserFields.idade: idade,
        UserFields.imagem: imagem,
      };

  User copy({
    int? id,
    String? nome,
    int? idade,
    Uint8List? imagem,
  }) =>
      User(
          id: id ?? this.id,
          nome: nome ?? this.nome,
          idade: idade ?? this.idade,
          imagem: imagem ?? this.imagem);

  static User fromJson(Map<String, Object?> json) => User(
        id: json[UserFields.id] as int?,
        nome: json[UserFields.nome] as String?,
        idade: json[UserFields.idade] as int?,
        imagem: json[UserFields.imagem] as Uint8List?,
      );
}
