// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ResponseLayout extends StatelessWidget {
  final Widget tiny;
  final Widget phone;
  final Widget tablet;
  final Widget largeTablet;
  final Widget computer;

  const ResponseLayout({
    Key? key,
    required this.tiny,
    required this.phone,
    required this.tablet,
    required this.largeTablet,
    required this.computer,
  }) : super(key: key);

  static const int tinyHeightLimit = 100;
  static const int tinyLimit = 270;
  static const int phoneLimit = 550;
  static const int tabletLimit = 800;
  static const int largeTabletLimit = 1100;

  //Altura limite
  static bool isTinyHeightLimit(BuildContext context) =>
      MediaQuery.of(context).size.height < tinyHeightLimit;
  //Largura limite
  static bool isTinyLimit(BuildContext context) =>
      MediaQuery.of(context).size.width < tinyLimit;
  //Phone
  static bool isPhoneLimit(BuildContext context) =>
      MediaQuery.of(context).size.height < phoneLimit &&
      MediaQuery.of(context).size.width >= tinyLimit;
  //Altura Max do tablet
  static bool isTabletLimit(BuildContext context) =>
      MediaQuery.of(context).size.height < tabletLimit &&
      MediaQuery.of(context).size.width >= phoneLimit;
  //Largura Max do lablet
  static bool isLargeTabletLimit(BuildContext context) =>
      MediaQuery.of(context).size.height < largeTabletLimit &&
      MediaQuery.of(context).size.width >= tabletLimit;
  //Largura limite do Computer
  static bool isComputerLimit(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeTabletLimit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < tinyLimit ||
            constraints.maxHeight < tinyHeightLimit) {
          return tiny;
        }
        if (constraints.maxWidth < phoneLimit) {
          return phone;
        }
        if (constraints.maxWidth < tabletLimit) {
          return tablet;
        }
        if (constraints.maxWidth < tabletLimit) {
          return tablet;
        }
        if (constraints.maxWidth < largeTabletLimit) {
          return largeTablet;
        } else {
          return computer;
        }
      },
    );
  }
}
