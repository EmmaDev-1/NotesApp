import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:note_app/components/perfil_tile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Profile",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.065,
            color: Theme.of(context).colorScheme.inversePrimary,
            fontFamily: 'QuickSand-Bold',
          ),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.background,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.inversePrimary,
          size: 25,
        ),
      ),
      body: perfilContent(),
    );
  }

  perfilContent() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Center(
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
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Text(
          'user@gmail.com',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.045,
            color: Theme.of(context).colorScheme.inversePrimary,
            fontFamily: 'QuickSand-Bold',
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 1,
          color: Color.fromARGB(193, 168, 168, 168),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Text(
                  'Profile Information',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontFamily: 'QuickSand-Bold',
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              PerfilTile(
                title: "First Name",
                value: "User",
                leading: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color.fromARGB(193, 168, 168, 168),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              PerfilTile(
                title: "Last Name",
                value: "User",
                leading: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color.fromARGB(193, 168, 168, 168),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 1,
          color: Color.fromARGB(193, 168, 168, 168),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Text(
                  'Personal Information',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontFamily: 'QuickSand-Bold',
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              PerfilTile(
                title: "User ID",
                value: "User",
                leading: Icon(
                  Icons.copy_rounded,
                  color: Color.fromARGB(193, 168, 168, 168),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              PerfilTile(
                title: "E-mail",
                value: "user@gmail.com",
                leading: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color.fromARGB(193, 168, 168, 168),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              PerfilTile(
                title: "Phone",
                value: "7717774411",
                leading: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color.fromARGB(193, 168, 168, 168),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 1,
          color: Color.fromARGB(193, 168, 168, 168),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              'Delete Profile',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.045,
                color: Colors.red,
                fontFamily: 'QuickSand-Bold',
              ),
            ))
      ],
    );
  }
}
