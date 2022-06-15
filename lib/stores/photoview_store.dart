import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto/db/interface_database.dart';
import 'package:projeto/model/model.dart';
part 'photoview_store.g.dart';

// // flutter packages pub run build_runner build
// // flutter packages pub run build_runner build --delete-conflicting-outputs
// // flutter packages pub run build_runner clean

// https://stackoverflow.com/questions/59668548/why-doesnt-build-runner-generate-files-when-serializing-json-in-dart-flutter
// flutter clean
// flutter pub get
// flutter packages pub run build_runner build --delete-conflicting-outputs

// class Refresher = ImageRefresher with _$Refresher;

// abstract class ImageRefresher with Store {
//   User? user;

//   @observable
//   Uint8List? UserImage;

//   @action
//   Future<void> fetch() async {
//     user = await getImage();
//     UserImage = user!.imagem;
//   }
// }

class Photoview = PhotoviewStore with _$Photoview;

abstract class PhotoviewStore with Store {
  @observable
  Uint8List? userImage;

  @action
  Future filePicker(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? selectImage = await _picker.pickImage(source: source);
    //print(selectImage!.path);

    // Armazena foto no banco
    File imageFile = File(selectImage!.path);
    userImage = await imageFile.readAsBytes();
    updateImage(userImage!);

    userImage; // Imagem atualiza após upload no banco

    //print("Update da imagem realizado");
  }
}
