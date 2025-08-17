import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_me/auth/auth_gate.dart';
import 'package:text_me/components/on_generate.dart';
import 'package:text_me/firebase_options.dart';
import 'package:text_me/pages/login_page.dart';
import 'package:text_me/pages/register_page.dart';
import 'package:text_me/thems/light_mode.dart';
import 'package:text_me/thems/theme_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context)=> ThemeProvider(),
      child: const MyApp(),
      )

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: LoginPage.routName,
     home: AuthGate(),
     theme: Provider.of<ThemeProvider>(context).themeData,
    debugShowCheckedModeBanner: false,
    );
  }
}
