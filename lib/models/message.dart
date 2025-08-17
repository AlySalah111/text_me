import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
final String senderEmail;
final String senderID;
  final String reciverID;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.senderID,
    required this.reciverID,
    required this.message,
    required this.timestamp,
    required this.senderEmail,
  });

  // convert to map
  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID,
      'reciverID': reciverID,
      'message': message,
      'timestamp': timestamp,
       'senderEmail': reciverID
    };
  }

  // from map
   



}