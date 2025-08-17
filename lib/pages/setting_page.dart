import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

static final String routName = 'SettingPage';
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: Text("settings"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,

      ),


    );
  }
}