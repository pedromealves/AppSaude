// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:projeto/home_page.dart';
import 'package:projeto/maps.dart';
import 'package:projeto/novo_medicamento.dart';
import 'edit_profile.dart';
import 'exames.dart';
import 'medicamentos.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/editprofile':
        return MaterialPageRoute(builder: (_) => EditProfile());

      case '/exames':
        return MaterialPageRoute(builder: (_) => Exames());

      case '/medicamentos':
        return MaterialPageRoute(builder: (_) => Home());

      case '/novo_medicamento':
        return MaterialPageRoute(builder: (_) => AddNewMedicine());

      case '/maps':
        return MaterialPageRoute(builder: (_) => Maps());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
