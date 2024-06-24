import 'package:flutter/material.dart';
import 'package:note_app/Utils/Navigation/navigationAnimationLeftRight.dart';
import 'package:note_app/components/perfil_tile.dart';
import 'package:note_app/view/login.dart';
import 'package:note_app/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileViewModel>(context, listen: false).fetchUserProfile();
    });
  }

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
      body: Consumer<ProfileViewModel>(
        builder: (context, profileViewModel, child) {
          if (profileViewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final userData = profileViewModel.userData;

          if (userData == null) {
            return const Center(child: Text('No user data available'));
          }

          return perfilContent(userData);
        },
      ),
    );
  }

  Widget perfilContent(Map<String, dynamic> userData) {
    String firstName = userData['firstName'] ?? '';
    String lastName = userData['lastName'] ?? '';
    String email = userData['email'] ?? '';

    TextEditingController firstNameController =
        TextEditingController(text: firstName);
    TextEditingController lastNameController =
        TextEditingController(text: lastName);

    return SingleChildScrollView(
      child: Column(
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
                  'assets/images/profile_Image.jpg',
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            email,
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
                  value: firstName,
                  leading: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color.fromARGB(193, 168, 168, 168),
                  ),
                  onTap: () => _showEditDialog(
                    context,
                    'First Name',
                    firstNameController,
                    (value) {
                      setState(() {
                        firstName = value;
                      });
                      Provider.of<ProfileViewModel>(context, listen: false)
                          .updateUserProfile(firstName, lastName);
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                PerfilTile(
                  title: "Last Name",
                  value: lastName,
                  leading: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color.fromARGB(193, 168, 168, 168),
                  ),
                  onTap: () => _showEditDialog(
                    context,
                    'Last Name',
                    lastNameController,
                    (value) {
                      setState(() {
                        lastName = value;
                      });
                      Provider.of<ProfileViewModel>(context, listen: false)
                          .updateUserProfile(firstName, lastName);
                    },
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
                  value: "For Admin Only",
                  leading: Icon(
                    Icons.copy_rounded,
                    color: Color.fromARGB(193, 168, 168, 168),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                PerfilTile(
                  title: "E-mail",
                  value: email,
                  leading: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color.fromARGB(193, 168, 168, 168),
                  ),
                  onTap: () {},
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
                  onTap: () {},
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
            onPressed: () => _showDeleteConfirmationDialog(context),
            child: Text(
              'Delete Profile',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.045,
                color: Colors.red,
                fontFamily: 'QuickSand-Bold',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showEditDialog(BuildContext context, String field,
      TextEditingController controller, Function(String) onSave) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $field'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: field,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                onSave(controller.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Profile'),
          content: const Text('Are you sure you want to delete your profile?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                _deleteProfile(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteProfile(BuildContext context) async {
    await Provider.of<ProfileViewModel>(context, listen: false)
        .deleteUserProfile();
    Navigator.pushAndRemoveUntil(
      context,
      crearRutaIzquierdaADerecha(context, const LoginPage()),
      (Route<dynamic> route) => false,
    );
  }
}
