import 'package:admindashboard_uiux/constants.dart';
import 'package:admindashboard_uiux/responsive_layout.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class ButtonsInfo {
  String title;
  IconData icon;
  String page;
  ButtonsInfo({required this.title, required this.icon, required this.page});
}

int _currentIndex = 0;

// Obj da lista
List<ButtonsInfo> _buttonNames = [
  ButtonsInfo(title: "Home", icon: Icons.home, page: "/subpage"),
  ButtonsInfo(title: "Setting", icon: Icons.settings, page: "/subpage"),
  ButtonsInfo(
      title: "Notifications", icon: Icons.notifications, page: "/subpage"),
  ButtonsInfo(
      title: "Contacts", icon: Icons.contact_phone_rounded, page: "/subpage"),
  ButtonsInfo(title: "Sales", icon: Icons.sell, page: "/subpage"),
  ButtonsInfo(
      title: "Marketing", icon: Icons.mark_email_read, page: "/subpage"),
  ButtonsInfo(title: "Security", icon: Icons.verified_user, page: "/subpage"),
  ButtonsInfo(
      title: "Users",
      icon: Icons.supervised_user_circle_rounded,
      page: "/subpage"),
];

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.kPadding),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Admin Menu",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: ResponseLayout.isComputerLimit(context)
                    ? null
                    : IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
              ),
              // Quadno Geramos Lista e necessario do ... no comeco
              ...List.generate(
                _buttonNames.length,
                //Pra cada index da lista ele repete
                (index) => Column(
                  children: [
                    Container(
                      // Baseado no Index escolhido ele muda a cor do Container
                      decoration: index == _currentIndex
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  Constants.redDark.withOpacity(0.9),
                                  Constants.orangeDark..withOpacity(0.9)
                                ],
                              ))
                          : null,
                      child: ListTile(
                        title: Text(
                          _buttonNames[index].title,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(Constants.kPadding),
                          child: Icon(
                            _buttonNames[index].icon,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                          });
                          Navigator.of(context)
                              .pushNamed(_buttonNames[index].page);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
