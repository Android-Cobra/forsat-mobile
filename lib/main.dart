import 'package:flutter/material.dart';
import 'package:forsat_frontend/router/route_constants.dart';
import 'package:forsat_frontend/router/router.dart';
import 'package:forsat_frontend/values/branding_color.dart';


void main() {
  runApp(Forsat());
}



class Forsat extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Forsat",
       debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: brandingColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: MyRouter.onGenerateRoute,
      initialRoute: signInRoute,
      //home: Container(),
    );
  }
}
