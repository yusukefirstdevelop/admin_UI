// ignore_for_file: prefer_final_fields

import 'package:admindashboard_uiux/constants.dart';
import 'package:admindashboard_uiux/panel_right/line_chart.dart';
import 'package:flutter/material.dart';

//
class Product {
  String name;
  bool enable;
  Product({this.enable = true, required this.name});
}

class PanelRightPage extends StatefulWidget {
  const PanelRightPage({Key? key}) : super(key: key);

  @override
  State<PanelRightPage> createState() => _PanelRightPageState();
}

class _PanelRightPageState extends State<PanelRightPage> {
  List<Product> _products = [
    Product(name: "name1", enable: true),
    Product(name: "name2", enable: true),
    Product(name: "name3", enable: true),
    Product(name: "name4", enable: true),
    Product(name: "name5", enable: true),
    Product(name: "name6", enable: true),
    Product(name: "name7", enable: true),
    Product(name: "name8", enable: true),
    Product(name: "name9", enable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
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
                  child: const ListTile(
                    title: Text(
                      "Net Revenue",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      "7% of sales Avg",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    trailing: Chip(
                      label: Text(
                        "897000",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            LineChartSample5(),
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
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
                  _products.length,
                  (index) => SwitchListTile.adaptive(
                      title: Text(
                        _products[index].name,
                        style: TextStyle(color: Colors.white),
                      ),
                      value: _products[index].enable,
                      onChanged: (newValue) {
                        setState(() {
                          _products[index].enable = newValue;
                        });
                      }),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
