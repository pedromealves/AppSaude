// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();
    return Scaffold(
        //backgroundColor:,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.green,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
        ),
        body: Container(
            padding: EdgeInsets.only(left: 16, top: 25, right: 16),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      "Editar Perfil",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          child: CircleAvatar(
                            radius: 71,
                            backgroundColor: Colors.lightGreen,
                            backgroundImage: image == null
                                ? AssetImage("assets/avatar.png")
                                : FileImage(File(image!.path)) as ImageProvider,
                            // child: ClipRRect(
                            //   borderRadius: BorderRadius.circular(60),
                            //   child: image == null
                            //       ? Image.asset("assets/avatar.png")
                            //       : Image.file(File(image!.path)),
                            // )

                            // child: image == null
                            //     ? Image.file(File("assets/avatar.png"))
                            //     : Image.file(File(image!.path)),

                            //backgroundImage: image == null
                            //    ? AssetImage("assets/avatar.png")
                            //    :
                            // child: Column(
                            //   children: [
                            //     image == null
                            //         ? Text("Imagem não encontrada")
                            //         : Image.file(File(image!.path)),

                            //   ],
                            // ),
                            //),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 4,
                              color: Colors.green,
                            ),
                            // boxShadow: [
                            //   BoxShadow(
                            //     spreadRadius: 2,
                            //     blurRadius: 10,
                            //     color: Colors.black.withOpacity(0.1),
                            //     offset: Offset(0, 10),
                            //   ),
                            // ],
                            shape: BoxShape.circle,
                            // image: DecorationImage(
                            //   fit: BoxFit.cover,
                            //   image: NetworkImage(
                            //       "https://www.freecodecamp.org/news/content/images/2021/03/Quincy-Larson-photo.jpg"),
                            // )
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: ((builder) => bottomSheet()),
                                );
                              },
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: "Nome Completo",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "",
                      // hintStyle: TextStyle(
                      //   fontSize: 16,
                      //   fontWeight: FontWeight.bold,
                      //   color: Colors.black,
                      // ),
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget bottomSheet() {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(children: <Widget>[
          Text("Escolha a foto de perfil",
              style: TextStyle(
                fontSize: 20,
              )),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  filePicker(ImageSource.camera);
                },
                label: Text("Câmera"),
                //child:
              ),
              TextButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  filePicker(ImageSource.gallery);
                },
                label: Text("Galeria"),
                //child:
              ),
            ],
          ),
        ]));
  }

  // Future photoPicker(ImageSource source) async {
  //   PickedFile? pickedFile = await _picker.pickImage(
  //     source: source,
  //   );

  //   if (pickedFile == null) {
  //     return null;

  //   setState(() {
  //     _imageFile = pickedFile as PickedFile;
  //   });
  // }

  // Future pickImage(ImageSource source) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return;

  //     final imageTemporary = File(image.path);
  //     setState(() {
  //       this.image = imageTemporary;
  //     });
  //   } on PlatformException catch (e) {
  //     //print('Failed to pick image: $e');
  //   }
  // }

  void filePicker(ImageSource source) async {
    final XFile? selectImage = await _picker.pickImage(source: source);
    print(selectImage!.path);

    setState(() {
      image = selectImage;
    });
  }
}
