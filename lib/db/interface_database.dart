import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '/model/model.dart';
import 'package:flutter/services.dart';
import '/edit_profile.dart';
import '/model/model.dart';
import 'saude_database.dart';
import '/home_page.dart';

// Cria usuário local se ele não existe
Future<User> newUser() async {
  User? userFromDB = await SaudeDatabase.instance.readUser(1);

  if (userFromDB != null) {
    //print('Usuário já criado');
    return userFromDB;
  } else {
    //print('O usuário foi criado agora');
    return await SaudeDatabase.instance.createUser(User());
  }
}

Future updateImage(Uint8List imageRaw) async {
  User? userFromDB = await SaudeDatabase.instance.readUser(1);

  userFromDB?.imagem = imageRaw;
  await SaudeDatabase.instance.updateUser(userFromDB!);
}

// Retorna uma imagem existeste ou null
Future<User?> getImage() async {
  User? userFromDB = await SaudeDatabase.instance.readUser(1);

  return userFromDB?.imagem == null ? null : userFromDB;
}

Future delUser() async {
  await SaudeDatabase.instance.deleteUser(1);
}

Future updateName(String nome) async {
  User? userFromDB = await SaudeDatabase.instance.readUser(1);

  userFromDB?.nome = nome.toString();
  await SaudeDatabase.instance.updateUser(userFromDB!);
}

Future<User?> getName() async {
  User? userFromDB = await SaudeDatabase.instance.readUser(1);

  return userFromDB?.nome == null ? null : userFromDB;
}
