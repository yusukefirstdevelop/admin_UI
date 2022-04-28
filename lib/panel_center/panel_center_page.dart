// ignore_for_file: prefer_const_constructors

import 'package:admindashboard_uiux/constants.dart';
import 'package:admindashboard_uiux/panel_center/bar_chart.dart';
import 'package:flutter/material.dart';

class Person {
  String name;
  Color color;
  Person({required this.name, required this.color});
}

class PanelCenterPage extends StatefulWidget {
  const PanelCenterPage({Key? key}) : super(key: key);
  @override
  State<PanelCenterPage> createState() => _PanelCenterPageState();
}

class _PanelCenterPageState extends State<PanelCenterPage> {
  // Lista de pessoal
  final List<Person> _persons = [
    Person(name: "Gabriel1", color: Constants.orangeLight),
    Person(name: "Gabriel2", color: Constants.blueLight),
    Person(name: "Gabriel3", color: Constants.redLight),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
              ),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ListTile(
                    title: Text(
                      "Products",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      "82% of Products Available",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    trailing: Chip(
                      label: Text(
                        "20500",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            BarChartSample2(),
            Padding(
              padding: EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding,
                bottom: Constants.kPadding,
              ),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: List.generate(
                    _persons.length,
                    (index) => ListTile(
                      leading: CircleAvatar(
                        radius: 15,
                        child: Text(
                          _persons[index].name.substring(0, 1),
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: _persons[index].color,
                      ),
                      title: Text(
                        _persons[index].name,
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
