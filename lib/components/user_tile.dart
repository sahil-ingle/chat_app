import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const UserTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 20,right: 20,top: 10),
        decoration: BoxDecoration(
          color: Colors.cyanAccent,
          borderRadius: BorderRadius.circular(20)
        ),
        padding: const EdgeInsets.all(15),
        child: Row(
            children: [
              const Icon(Icons.person,size: 40,),
              const SizedBox(width: 15),
              Expanded(child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(text, style: const TextStyle(fontSize: 20),)))

            ],
          ),
      ),
    );
    
  }
}