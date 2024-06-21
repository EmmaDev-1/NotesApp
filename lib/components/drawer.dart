import 'package:flutter/material.dart';
import 'package:note_app/Utils/Navigation/navegationAnimationRightLeft.dart';
import 'package:note_app/Utils/Navigation/navigationAnimationLeftRight.dart';
import 'package:note_app/components/drawer_tile.dart';
import 'package:note_app/view/login.dart';
import 'package:note_app/view/profile.dart';
import 'package:note_app/view/settings.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      child: Column(
        children: [
          DrawerHeader(
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                  'assets/images/googleLogo.png',
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          DrawerTile(
            title: "My Notes",
            leading: Icon(
              Icons.home_rounded,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          DrawerTile(
            title: "Profile",
            leading: Icon(
              Icons.person_rounded,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                crearRuta(context, const ProfilePage()),
              );
            },
          ),
          DrawerTile(
            title: "Settings",
            leading: Icon(
              Icons.settings_rounded,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                crearRuta(context, const SettingsPage()),
              );
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: 1,
            color: Color.fromARGB(190, 255, 255, 255),
          ),
          DrawerTile(
            title: "Log out",
            leading: Icon(
              Icons.exit_to_app_rounded,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                crearRutaIzquierdaADerecha(context, const LoginPage()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
