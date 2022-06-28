import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto/db/interface_database.dart';
part 'photoview_store.g.dart';

class Photoview = PhotoviewStore with _$Photoview;

abstract class PhotoviewStore with Store {
  @observable
  Uint8List? userImage;

  @action
  Future filePicker(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? selectImage = await _picker.pickImage(
        source: source, imageQuality: 85, maxHeight: 200, maxWidth: 200);

    //print(selectImage!.path);

    // Armazena foto no banco
    File imageFile = File(selectImage!.path);
    userImage = await imageFile.readAsBytes();
    updateImage(userImage!);

    userImage; // Imagem atualiza após upload no banco

    //print("Update da imagem realizado");
  }
}
