// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:projeto/list_item.dart';
import 'api/pdf_api.dart';
import 'api/pdf_viewer_page.dart';

class ListItemWidget extends StatelessWidget {
  final ListItem item;
  final Animation<double> animation;
  final VoidCallback? onClicked;

  const ListItemWidget({
    required this.item,
    required this.animation,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizeTransition(
        key: ValueKey(item.image),
        sizeFactor: animation,
        child: buildItem(context),
      );

  Widget buildItem(BuildContext context) => Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: ListTile(
          onTap: () async {
            if (item.file == null) {
              if (item.image == "ignore") {
                return;
              }

              final file = await PDFApi.pickFile();

              final fileName = await PDFApi.pickFileName();

              item.title = fileName;
              item.file = file;

              PDFApi.uploadFile(file);

              if (file != null) {
                openPDF(context, file);
              } else {
                return;
              }
            } else {
              openPDF(context, item.file!);
            }
          },
          contentPadding: EdgeInsets.all(16),
          leading: CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage("assets/pdf.jpg"),
          ),
          title: Text(
            item.title!,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.red, size: 32),
            onPressed: onClicked,
          ),
        ),
      );

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );
}
