// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations, non_constant_identifier_names

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:projeto/api/firebase_api.dart';
import 'package:projeto/api/pdf_api.dart';
import 'package:projeto/list_item_widget.dart';

import 'list.items.dart';
import 'list_item.dart';

firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;

class Exames extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExamesState();
}

class ExamesState extends State<Exames> {
  final listKey = GlobalKey<AnimatedListState>();
  final List<ListItem> items = List.from(listItems);

  //fi nal ListResult filesFromFB;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    getFilesFromFB();
    return Scaffold(
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
      body: AnimatedList(
        key: listKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) => ListItemWidget(
          item: items[index],
          animation: animation,
          onClicked: () => removeItem(index),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: InsertItem,
      ),
    );
  }

  void InsertItem() {
    final newIndex = 1;

    final newItem = ListItem(
      title: 'PDF',
      urlImage:
          'https://i.pinimg.com/736x/28/d1/61/28d1616c72589f9b4a633bb7dccfcfc3.jpg',
      file: null,
    );

    items.insert(newIndex, newItem);
    listKey.currentState!.insertItem(
      newIndex,
      duration: Duration(milliseconds: 500),
    );
  }

  void InsertItemFromFB(File file) {
    final newIndex = 1;

    final newItem = ListItem(
      title: '',
      urlImage:
          'https://i.pinimg.com/736x/28/d1/61/28d1616c72589f9b4a633bb7dccfcfc3.jpg',
      file: file,
    );

    items.insert(newIndex, newItem);
    listKey.currentState!.insertItem(
      newIndex,
      duration: Duration(milliseconds: 500),
    );
  }

  void removeItem(int index) {
    final removedItem = items[index];

    items.removeAt(index);
    listKey.currentState!.removeItem(
      index,
      (context, animation) => ListItemWidget(
          item: removedItem, animation: animation, onClicked: () {}),
      duration: Duration(milliseconds: 500),
    );
  }

  Future<void> getFilesFromFB() async {
    late final List<String> urlsPDF;
    urlsPDF = await FirebaseApi.listAll('/files');

    for (var element in urlsPDF) {
      InsertItemFromFB(await PDFApi.loadNetwork(element));
    }
  }
}
