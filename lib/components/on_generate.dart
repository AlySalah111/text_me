import 'package:flutter/material.dart';
import 'package:text_me/pages/home_page.dart';
import 'package:text_me/pages/login_page.dart';
import 'package:text_me/pages/register_page.dart';
import 'package:text_me/pages/setting_page.dart';

Route<dynamic>onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'RegisterPage':
      return MaterialPageRoute(builder: (context) => RegisterPage());
    case 'LoginPage':
      return MaterialPageRoute(builder: (context) =>  LoginPage());
    case 'HomePage':
      return MaterialPageRoute(builder: (context) =>  HomePage());
      case 'SettingPage':
      return MaterialPageRoute(builder: (context) => const SettingPage());
    
    default:
      return MaterialPageRoute(builder:(context)=>const Scaffold());
        
      
  }
}