import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  final Color colorName;
  
  const ChatBubble({super.key, required this.message, required this.isCurrentUser, required this.colorName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 10, right: 10, top: 5),
      decoration: BoxDecoration(
        color: colorName,
        borderRadius: BorderRadius.circular(15)
      ),

      child: Text(message, style: TextStyle(color: Colors.white, fontSize: 15),)
    );
  }
}