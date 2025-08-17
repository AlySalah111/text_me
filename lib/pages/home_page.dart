

import 'package:flutter/material.dart';
import 'package:text_me/chat/chat_services.dart';
import 'package:text_me/components/user_tile.dart';
import 'package:text_me/pages/chat_page.dart';
import 'package:text_me/services/auth_services.dart';
import 'package:text_me/components/my_drawer.dart';


class HomePage extends StatelessWidget {
   HomePage({super.key});

  
static final  String routName = 'HomePage';
// chat and auth services 
final AuthServices authServices = AuthServices();
final ChatServices chatServices = ChatServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Page',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            )),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 10,
       
      ),

      drawer: MyDrawer(),
      body: buildUserList(),
    );
  }
  Widget buildUserList(){
return StreamBuilder(
stream:  chatServices.getUsersStream(),
builder: (context,snapshot){
// error 
if(snapshot.hasError){
return const Text("Error");
}

// loading..
if(snapshot.connectionState == ConnectionState.waiting){
return const Text('loading...');
}


// return list of users
return ListView(
  children: [
    ...snapshot.data!.map<Widget>((userData) => buildUserListItem(userData, context)).toList(),
  ],
);

},
  
);

  }
  // build user list item
  Widget buildUserListItem(Map<String, dynamic>userData, BuildContext context){
 // display all users except the current user 
return UserTile(
  text: userData['email'], 
  onTap: (){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatPage(receiverEmail: userData['email'],),
      ),
    );
  }
  );

  }

}