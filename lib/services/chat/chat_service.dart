import 'package:chat_app/models.dart/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get chat stream

  Stream<List<Map<String,dynamic>>> getUserStream(){
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc){

      final user = doc.data();

      return user;

      }).toList();

    });
  }

  //send message 

  Future<void> sendMessage(String receiverID, message) async{
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();
    
//crease new message
    Message newMessage = Message(
        senderID: currentUserID,
        senderEmail: currentUserEmail,
        receiverID: receiverID,
        message: message,
        timestamp: timestamp);
    

  // create chat room id for 2 users

    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    await _firestore.collection("chat_room").doc(chatRoomID).collection("message").add(newMessage.toMap());
}

//get nessage
  Stream<QuerySnapshot> getMessage(String userID, otherUserID){
    List<String>ids = [userID,otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');
    return _firestore.collection('chat_room').doc(chatRoomID).collection('message').orderBy('timestamp',descending: false).snapshots();
  }

}