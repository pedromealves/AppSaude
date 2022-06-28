// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:projeto/route_generator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'edit_profile.dart';
import '/model/model.dart';
import '/db/saude_database.dart';
import '/db/interface_database.dart';

import '/stores/photoview_store.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        primaryColor: Color.fromARGB(255, 218, 233, 219),
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 30.0, fontFamily: 'Hind'),
          bodyText2: TextStyle(fontSize: 20.0, fontFamily: 'Hind'),
        ),
      ),
      title: "Saúde",
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Future<User> user = newUser();
  final _photoview = Photoview();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 233, 219),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FutureBuilder<User?>(
                            future: getName(),
                            builder: (context, snapshot) {
                              String? userName = snapshot.data?.nome;
                              return Container(
                                child: userName == null
                                    ? Text("Olá",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1)
                                    : Text("Olá, \n $userName",
                                        style: TextStyle(
                                          fontSize: 25,
                                        )),
                              );
                            }),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/editprofile');
                      },
                      child: FutureBuilder<User?>(
                          future: getImage(),
                          builder: (context, snapshot) {
                            Uint8List? userImage = snapshot.data?.imagem;
                            return Container(
                              width: 100,
                              height: 100,
                              child: CircleAvatar(
                                  radius: 71,
                                  backgroundColor: Colors.lightGreen,
                                  backgroundImage: userImage == null
                                      ? AssetImage("assets/avatar.png")
                                      : MemoryImage(userImage)
                                          as ImageProvider),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 4,
                                  color: Colors.green,
                                ),
                                shape: BoxShape.circle,
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 50),
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/exames');
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Text(
                            'Exames',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/medicamentos');
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Text(
                            'Medicamentos',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/maps');
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Text(
                            'Hospitais Próximos',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
