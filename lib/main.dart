import 'package:admindashboard_uiux/constants.dart';
import 'package:admindashboard_uiux/routertest.dart';
import 'package:admindashboard_uiux/widget_tree.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Constants.purpleDark,
          canvasColor: Constants.purpleLight),
      home: WidgetTree(),
      routes: <String, WidgetBuilder>{
        '/subpage': (BuildContext context) => new TesteRouter()
      },
    );
  }
}
