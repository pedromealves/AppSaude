// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:projeto/route_generator.dart';
import 'edit_profile.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        primaryColor: Colors.green[100],
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 30.0, fontFamily: 'Hind'),
          bodyText2: TextStyle(fontSize: 20.0, fontFamily: 'Hind'),
          //headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          //headline1: TextStyle(fontSize: 90.0, fontWeight: FontWeight.bold),
        ),
      ),
      title: "Saúde",
      //home: HomePage(),
      //routes: {'/editprofile': (_) => EditProfile()},
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
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
                        // Text("Olá,",
                        //     style:
                        //         TextStyle(fontSize: 25, color: Colors.black45)),
                        Text("Olá,",
                            style: Theme.of(context).textTheme.bodyText1),
                        // Text("José",
                        //     style: TextStyle(
                        //         fontSize: 25, fontWeight: FontWeight.bold)),
                        Text("José",
                            style: Theme.of(context).textTheme.bodyText1)
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/editprofile');
                      },
                      child: CircleAvatar(
                        radius: 35,
                      ),
                    ),
                  ],
                ),
              ),
              //Padding(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 50),
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/exames');
                      },
                      child: Card(
                        elevation: 10,
                        //color: Colors.green[200],
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Text(
                            'Exames',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      //color: Colors.green[200],
                      child: Padding(
                        padding: const EdgeInsets.all(50),
                        child: Text(
                          'Medicamentos',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                    // Card(
                    //   elevation: 10,
                    //   //color: Colors.green[200],
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(50),
                    //     child: Text(
                    //       'Texto',
                    //       style: TextStyle(color: Colors.green),
                    //     ),
                    //   ),
                    // ),
                    // Card(
                    //   //color: Colors.green[200],
                    //   elevation: 10,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(50),
                    //     child: Text(
                    //       'Texto',
                    //       style: TextStyle(color: Colors.green),
                    //     ),
                    //   ),
                    // ),
                    // Card(
                    //   //color: Colors.green[200],
                    //   elevation: 10,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(50),
                    //     child: Text(
                    //       'Texto',
                    //       style: TextStyle(color: Colors.green),
                    //     ),
                    //   ),
                    // ),
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
