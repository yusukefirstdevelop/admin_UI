import 'package:admindashboard_uiux/constants.dart';
import 'package:admindashboard_uiux/responsive_layout.dart';
import 'package:flutter/material.dart';

List<String> _buttonNames = ["Overview", "Revenue", "Sales", "Control"];
int _currentSelectedButton = 0;

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.purpleLight,
      child: Row(
        children: [
          if (ResponseLayout.isComputerLimit(context))
            Container(
              margin: EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 30,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset("asset/logo.png")),
              ),
            )
          else
            IconButton(
              color: Colors.white,
              iconSize: 30,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
          SizedBox(width: Constants.kPadding),
          if (ResponseLayout.isComputerLimit(context))
            OutlinedButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(Constants.kPadding / 2),
                child: Text("Admin Panel"),
              ),
              style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  side: BorderSide(color: Colors.white, width: 0.4)),
            ),
          Spacer(),
          SizedBox(
            width: Constants.kPadding,
          ),

          // mostra Tudos os nomes(Topico) no appbar
          if (ResponseLayout.isComputerLimit(context))
            ...List.generate(
              _buttonNames.length,
              (index) => TextButton(
                onPressed: () {
                  setState(() {
                    _currentSelectedButton = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(Constants.kPadding * 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        //Para cada Topico aparece o seu texto
                        _buttonNames[index],
                        style: TextStyle(
                          color: _currentSelectedButton == index
                              ? Colors.white
                              : Colors.white70,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(Constants.kPadding / 2),
                        width: 60,
                        height: 2,
                        decoration: BoxDecoration(
                          //Linha em baixo do texto do topico
                          gradient: _currentSelectedButton == index
                              ? LinearGradient(colors: [
                                  Constants.redDark,
                                  Constants.orangeDark,
                                ])
                              : null,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          else
            //Se caso o tamanho da tela for menor q o tamanho do Computador no Top monstrada
            // o index do topo selecionado
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "- " + _buttonNames[_currentSelectedButton] + " -",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.all(Constants.kPadding / 2),
                      width: 60,
                      height: 2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Constants.redDark, Constants.orangeDark],
                        ),
                      ))
                ],
              ),
            ),
          Spacer(),
          IconButton(
            color: Colors.white,
            iconSize: 30,
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          Stack(
            children: [
              IconButton(
                color: Colors.white,
                iconSize: 30,
                onPressed: () {},
                icon: Icon(Icons.notifications_none_outlined),
              ),
              // Counter de notificacao
              const Positioned(
                right: 6,
                top: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 8,
                  child: Text(
                    "3",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          if (!ResponseLayout.isPhoneLimit(context))
            Container(
              margin: EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Constants.orangeDark,
                radius: 30,
                //Imagem 96x96
                child: ClipRRect(child: Image.asset("asset/chameleon.png")),
              ),
            )
        ],
      ),
    );
  }
}
