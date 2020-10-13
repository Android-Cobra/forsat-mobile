import 'package:flutter/material.dart';
import 'package:forsat_frontend/router/route_constants.dart';
import 'package:forsat_frontend/router/router.dart';


void main() {
  runApp(Forsat());
}

class Forsat extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forsat',
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: MyRouter.onGenerateRoute,
      initialRoute: homeRoute,
      //home: Container(),
    );
  }
}
