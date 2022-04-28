import 'dart:html';

import 'package:admindashboard_uiux/constants.dart';
import 'package:admindashboard_uiux/panel_left/curved_chart.dart';
import 'package:admindashboard_uiux/panel_left/pie_chart.dart';
import 'package:admindashboard_uiux/responsive_layout.dart';
import 'package:flutter/material.dart';

class Todo {
  String name;
  bool enable;
  Todo({this.enable = true, required this.name});
}

class PanelLeftPage extends StatefulWidget {
  PanelLeftPage({Key? key}) : super(key: key);

  @override
  State<PanelLeftPage> createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  List<Todo> _toDo = [
    Todo(name: "Purchase Paper", enable: true),
    Todo(name: "Refill", enable: false),
    Todo(name: "Hire someone", enable: true),
    Todo(name: "Marketing Strategy", enable: true),
    Todo(name: "Selling furniture", enable: true),
    Todo(name: "Selling firniture", enable: true),
    Todo(name: "Finish the disclosure", enable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (ResponseLayout.isComputerLimit(context))
            Container(
              color: Constants.purpleLight,
              width: 50,
              child: Container(
                decoration: BoxDecoration(
                  color: Constants.purpleDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
            ),
          SingleChildScrollView(
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
                    child: Container(
                      width: double.infinity,
                      child: ListTile(
                        title: Text(
                          "Product sold",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "20% of Product sold",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Chip(
                          label: Text(
                            "4500",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //LineChart
                LineChartSample2(),
                //PieChart
                PieChartSample2(),
                Padding(
                  padding: EdgeInsets.only(
                    left: Constants.kPadding / 2,
                    right: Constants.kPadding / 2,
                    top: Constants.kPadding / 2,
                    bottom: Constants.kPadding,
                  ),
                  child: Card(
                    color: Constants.purpleLight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      children: List.generate(
                        _toDo.length,
                        (index) => CheckboxListTile(
                          title: Text(
                            _toDo[index].name,
                            style: TextStyle(color: Colors.white),
                          ),
                          value: _toDo[index].enable,
                          onChanged: (newValue) {
                            setState(() {
                              _toDo[index].enable = newValue ?? true;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
