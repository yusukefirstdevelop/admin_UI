// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admindashboard_uiux/app_bar/app_bar_widget.dart';
import 'package:admindashboard_uiux/panel_center/panel_center_page.dart';
import 'package:admindashboard_uiux/panel_left/panel_left_page.dart';
import 'package:admindashboard_uiux/panel_right/panel_right_page.dart';
import 'package:admindashboard_uiux/responsive_layout.dart';
import 'package:flutter/material.dart';

import 'drawer/drawer_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetState();
}

class _WidgetState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: (ResponseLayout.isTinyLimit(context) ||
                ResponseLayout.isTinyHeightLimit(context)
            //TRUE
            ? Container()
            // FALSE
            : AppBarWidget()),
        preferredSize: Size(double.infinity, 100),
      ),
      //Widget para cada plataforma
      body: ResponseLayout(
        tiny: Container(),
        phone: PanelCenterPage(),
        tablet: Row(
          children: [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
          ],
        ),
        largeTablet: Row(
          children: [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(child: PanelRightPage()),
          ],
        ),
        computer: Row(
          children: [
            Expanded(child: DrawerPage()),
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(child: PanelRightPage()),
          ],
        ),
      ),
      //Side bar
      drawer: DrawerPage(),
      // bottomNavigationBar: ResponseLayout.isPhoneLimit(context)
      //     ? CurvedNavigationBar(
      //         index: currentIndex,
      //         backgroundColor: Constants.purpleDark,
      //         items: _icons,
      //         onTap: (index) {
      //           setState(() {
      //             currentIndex = index;
      //           });
      //         },
      //       )
      // : SizedBox(),
    );
  }
}
