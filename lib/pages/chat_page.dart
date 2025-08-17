import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:text_me/chat/chat_services.dart';
import 'package:text_me/components/chat_bubble.dart';
import 'package:text_me/components/custom_textField.dart';
import 'package:text_me/services/auth_services.dart';

class ChatPage extends StatelessWidget {
   ChatPage({super.key, required this.receiverEmail,
   required this.receiverID
   
   });
static final String routName = 'ChatPage';
final String receiverEmail;
final String receiverID ;// This should be replaced with actual receiver ID logic

TextEditingController messageController = TextEditingController();

final ChatServices chatSevices = ChatServices();
final AuthServices authServices = AuthServices();

//send message 
void sendMessage()async{
if(messageController.text.isNotEmpty){
  await chatSevices.sendMessage(receiverID, messageController.text);
  messageController.clear();


}


}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
      ),
      body:Column(
        children: [
          Expanded(
            child: buildMessageList(),

          ),
          buildUserInput(),
        ],
      ) ,
    );
  }


  Widget buildMessageList(){

String senderId = authServices.getCurrentUser() !.uid;
return StreamBuilder(
  stream: chatSevices.getMessages(senderId, receiverID),
  builder: (context, snapshot) {
    //error
    if(snapshot.hasError){
      return const Text("Error ");

    }
    //loading 
    if(snapshot.connectionState == ConnectionState.waiting){
      return const Center(child: CircularProgressIndicator());

    }
    // return list of messages
    return ListView(
      children: [
        ...snapshot.data!.docs.map((doc) => buildMessageItem(doc)).toList(),
      ],
    );
  },
  
  );
  }

  //build message item
  Widget buildMessageItem(DocumentSnapshot doc){

Map<String, dynamic >data = doc.data() as Map<String, dynamic>;
 
  // is current user 
 bool isCurrentUser = data['senderID'] == authServices.getCurrentUser()!.uid;


  // message align to the right if sender is the current user 
var aligment = 
isCurrentUser? Alignment.centerRight : Alignment.centerLeft;

  // message color

return Container(
  alignment: aligment,
  child: Column(
    crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
    children: [
      ChatBubble(
        message:data['message'],
        isCurrentUser: isCurrentUser,
        ),
    ],
  ));
  }

// build message input 
Widget buildUserInput(){
return Padding(
  padding: const EdgeInsets.only(bottom: 50.0),
  child: Row(
    children: [
      
         Expanded(
           child: CustomTextfield(
            controller: messageController,
            hintText: 'Type a message',
            obscureText: false,
                 ),
         ),
        
        Container(
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
            ),
            margin: EdgeInsets.only(right: 25),
          child: IconButton(onPressed: sendMessage, icon: Icon(
            color: Colors.white,
            Icons.arrow_upward)
            ,
            ),
            ),
    ],
  ),
);

}
  
}