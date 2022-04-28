import 'package:flutter/material.dart';

class TesteRouter extends StatefulWidget {
  const TesteRouter({Key? key}) : super(key: key);

  @override
  State<TesteRouter> createState() => _TesteRouterState();
}

class _TesteRouterState extends State<TesteRouter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "HY",
            style: TextStyle(
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
