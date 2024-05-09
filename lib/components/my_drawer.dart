import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});


  void signOut(){
    final FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
          backgroundColor: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [  

                  const DrawerHeader(child: Icon(Icons.message, size: 75,)),


                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: ListTile(
                      leading: const Icon(Icons.home,size: 30,),
                      title: const Text("Home", style: TextStyle(fontSize: 20),),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),  
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: ListTile(
                      leading: const Icon(Icons.settings, size: 30,),
                      title: const Text("Settings", style: TextStyle(fontSize: 20),),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ) ,
                  ],

                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 20),
                    child: ListTile(
                      leading: const Icon(Icons.logout,size: 30,),
                      title: const Text("Logout", style: TextStyle(fontSize: 20),),
                      onTap: () {
                        signOut();
                      },
                       ),
                  ),
            ],
          ),
          
          );
  }
}