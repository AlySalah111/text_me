import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:text_me/models/message.dart';

class ChatServices {
 // get inestance of fireStore
 final FirebaseFirestore firestore = FirebaseFirestore.instance;
 final FirebaseAuth auth = FirebaseAuth.instance;

 // get user stream 
  
Stream<List <Map<String,dynamic>>> getUsersStream(){

return firestore.collection('Users').snapshots().map((snapshot){

return snapshot.docs.map((doc){
// go thorough each individual user
final user = doc.data();

return user;
}).toList();
}

);
}

 // send massages 
Future <void>sendMessage(String reciverID, message)async{
  // get current user

  final String currentUserID = auth.currentUser!.uid;
  final String currentUserEmail= auth.currentUser!.email!;
  final Timestamp timestamp = Timestamp.now();
  // create a new message
Message newMessage = Message(
senderEmail: currentUserEmail,
senderID: currentUserID,
reciverID: reciverID,
message: message,
timestamp: timestamp,




);

// construct message room ID for the two users to ensure uniquness 
List<String> ids = [currentUserID, reciverID];
ids.sort(); // sort to ensure consistent order
String chatRoomID = ids.join('_');
  // save message to firestore
await firestore.collection('ChatRooms').doc(chatRoomID).collection('Messages').add(newMessage.toMap());

  // also save message to the reciver's chat room
  await firestore.collection('ChatRooms').doc(reciverID).collection('Messages').add(newMessage.toMap());
}

 // get masseges
 Stream<QuerySnapshot>getMessages(String userID , otherUserID){
  // construct chat room ID for the two users  
  List<String> ids = [userID, otherUserID];
  ids.sort(); // sort to ensure consistent order
  String chatRoomID = ids.join('_');

  return firestore.collection('ChatRooms').doc(chatRoomID).collection('Messages').orderBy('timestamp', descending: false).snapshots();


 }

}   