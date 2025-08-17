import 'package:flutter/material.dart';
import 'package:text_me/services/auth_services.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

void logout(){
  final auth = AuthServices();
  auth.signOut();
}
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //logo
          DrawerHeader(
            child: Center(
              child: DrawerHeader(
                child: Icon(
                  Icons.message,
                  color: Theme.of(context).colorScheme.primary,
                  size: 50,
                ),
              ),
            ),
          ),

          //home list tile
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: ListTile(
              title: Text(
                'H O M E',
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),

          //setting list tile
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: ListTile(
              title: Text(
                'S E T T I N G S',
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pushNamed(context, 'SettingPage');
              },
            ),
          ),

          // logout

          Padding(
            padding: const EdgeInsets.only(left: 20,top: 20),
            child: ListTile(
              title: Text(
                'L O G O U T',
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              leading: Icon(Icons.logout),
              onTap: () {
                logout();
                Navigator.pushReplacementNamed(context, 'LoginPage');
              },
            ),
          ),
        ],
      ),
    );
  }
}
