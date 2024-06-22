// lib/view/register_page.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/Utils/Navigation/navegationAnimationRightLeft.dart';
import 'package:note_app/Utils/Navigation/navigationAnimationLeftRight.dart';
import 'package:note_app/components/mediaAuth.dart';
import 'package:note_app/view/dashboard.dart';
import 'package:note_app/view/login.dart';
import 'package:note_app/view_model/register_view_mocel.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  bool _obscureTextRepeat = true;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordControllerRepeat =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordControllerRepeat.dispose();
    super.dispose();
  }

  Future<void> _registerUser() async {
    if (nameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        passwordControllerRepeat.text.isEmpty) {
      _showErrorDialog(
        'Incomplete Form',
        'All fields must be filled out.',
      );
      return;
    }

    if (passwordController.text != passwordControllerRepeat.text) {
      _showErrorDialog(
        'Password Error',
        'Passwords don\'t match. Please verify and try again.',
      );
      return;
    }

    _showLoadingDialog();

    try {
      final registerViewModel =
          Provider.of<RegisterViewModel>(context, listen: false);
      await registerViewModel.registerUser(
        firstName: nameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
      );

      Navigator.pop(context);
      Navigator.push(
        context,
        crearRuta(context, DashboardPage()),
      );
      _showWelcomeDialog(nameController.text);
    } catch (e) {
      Navigator.pop(context);
      _showErrorDialog(
        'Registration Error',
        e.toString(),
      );
    }
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 255, 94, 0)),
          ),
        );
      },
    );
  }

  Future<void> _showErrorDialog(String title, String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showWelcomeDialog(String firstName) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Welcome $firstName!',
            textAlign: TextAlign.center,
          ),
          content: Lottie.asset(
            'assets/animations/success.json',
            repeat: false,
            frameRate: FrameRate.max,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.03,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).colorScheme.tertiary,
                    Theme.of(context).colorScheme.background,
                  ],
                ),
              ),
              child: _registerForm(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerForm() {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.05,
              fontWeight: FontWeight.bold,
              fontFamily: 'QuickSand-Bold',
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTextField(
              controller: nameController,
              hintText: 'First Name',
              widthFactor: 0.42,
            ),
            _buildTextField(
              controller: lastNameController,
              hintText: 'Last Name',
              widthFactor: 0.42,
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        _buildTextField(
          controller: emailController,
          hintText: 'Email',
          widthFactor: 1.0,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        _buildTextField(
          controller: passwordController,
          hintText: 'Password',
          obscureText: _obscureText,
          onChanged: (text) {
            setState(() {
              _obscureText = text.isEmpty ? true : _obscureText;
            });
          },
          suffixIcon: passwordController.text.isEmpty
              ? null
              : IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        _buildTextField(
          controller: passwordControllerRepeat,
          hintText: 'Confirm Password',
          obscureText: _obscureTextRepeat,
          onChanged: (text) {
            setState(() {
              _obscureTextRepeat = text.isEmpty ? true : _obscureTextRepeat;
            });
          },
          suffixIcon: passwordControllerRepeat.text.isEmpty
              ? null
              : IconButton(
                  icon: Icon(
                    _obscureTextRepeat
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureTextRepeat = !_obscureTextRepeat;
                    });
                  },
                ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        Container(
          height: MediaQuery.of(context).size.height * 0.065,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ElevatedButton(
            onPressed: _registerUser,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 0, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: const Text(
              'Sign up',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'QuickSand-Bold',
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              crearRutaIzquierdaADerecha(context, const LoginPage()),
            );
          },
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.035,
                color: Theme.of(context).colorScheme.inversePrimary,
                fontFamily: 'QuickSand-Bold',
              ),
              children: [
                const TextSpan(text: 'Already have an account? '),
                TextSpan(
                  text: 'Sign In',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 0, 0),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.025),
        const MediaAuth()
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    Function(String)? onChanged,
    double widthFactor = 1.0,
    Widget? suffixIcon,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * widthFactor,
      child: TextField(
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(0, 116, 73, 73),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(143, 255, 0, 0),
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 255, 0, 0),
              width: 1.0,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.045,
            fontFamily: 'QuickSand',
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          contentPadding: const EdgeInsets.all(15.0),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
