// class ListItem {
//   final String title;
//   final String urlImage;

//   const ListItem({
//     required this.title,
//     required this.urlImage,
//   });
// }

//import 'dart:html';

import 'dart:io';

class ListItem {
  String? title;
  String? urlImage;
  File? file;

  //ListItem({this.title, this.urlImage});

  ListItem({
    required this.title,
    required this.urlImage,
    required this.file,
  });
}
