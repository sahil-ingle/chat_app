
import 'package:chat_app/components/my_drawer.dart';
import 'package:chat_app/components/user_tile.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _authServices = AuthService();
  final _chatServices = ChatService();



  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Chat App"),
          backgroundColor: Colors.cyanAccent,
          elevation: 1,
          
        ),
        drawer: const MyDrawer(),
        body: _buildUserList(),

      );
    
  }

Widget _buildUserList(){
  return StreamBuilder(
    stream: _chatServices.getUserStream(),
     builder: (context, snapshot){
      if(snapshot.hasError){
        return const Text("Error");
      }

      if (snapshot.connectionState == ConnectionState.waiting){
        return const Text("Loading");
      }

      return ListView(
        children: snapshot.data!.map<Widget>(
          (userData) => _buildUserListItem(userData, context)).toList()
        );
     }
     );
}

Widget _buildUserListItem(
  Map<String,dynamic>userData, BuildContext context
){
  if (userData["email"] != _authServices.getCurrentUser()!.email){
    return UserTile(text: userData["name"], onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(receiverEmail: userData["name"],receiverID: userData['uid'],)),
    );
    }
    );
  }else{
    return Container();
  }
}

}