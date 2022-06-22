// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto/list_item.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
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
        key: ValueKey(item.urlImage),
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
            //Navigator.of(context).pushNamed('/');

            // Se existe PDF, exibe o PDF da firebase

            // final url =
            //     'https://www.sef.sc.gov.br/arquivos_portal/servicos/42/Roteiro_para_criacao_de_assinatura_digital_em_PDF___1.1.pdf';
            // final file = await PDFApi.loadNetwork(url);
            // openPDF(context, file);

            if (item.file == null) {
              final file = await PDFApi.pickFile();

              final fileName = await PDFApi.pickFileName();

              item.title = fileName;
              item.file = file;

              print(item.title);
              print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!');

              PDFApi.uploadFile(file);

              if (file == null) return;
              openPDF(context, file);
            } else {
              if (item.file == null) return;
              openPDF(context, item.file!);
            }

            // Se não existe, faz o attach e coloca na firebase
          },
          contentPadding: EdgeInsets.all(16),
          leading: CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(item.urlImage!),
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
