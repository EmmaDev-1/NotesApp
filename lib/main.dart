import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/Utils/theme/theme_provider.dart';
import 'package:note_app/view/landing_page.dart';
import 'package:note_app/view_model/login_view_model.dart';
import 'package:note_app/view_model/note_view_model.dart';
import 'package:note_app/view_model/profile_view_model.dart';
import 'package:note_app/view_model/register_view_mocel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA7I4TxyPimq-igIoE0KsWXWDClgWCPxPQ",
      appId: "1:456925582745:android:ee0a99bee8bf3768296f08",
      messagingSenderId: "456925582745",
      projectId: "notesapp-2b0e5",
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => RegisterViewModel()),
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => NoteViewModel()),
        ChangeNotifierProvider(create: (context) => ProfileViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const LandingPage(),
    );
  }
}
