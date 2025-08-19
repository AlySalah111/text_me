import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_me/thems/theme_provider.dart';

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

      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
        ),
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(12),
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        
            Text('Dark Mode'),
            CupertinoSwitch( value : Provider.of<ThemeProvider>(context, listen: false).isDarkMode,

             onChanged: (value){
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme(); 
             },

             ),
          ],
        ),
      ),
    );
  }
}