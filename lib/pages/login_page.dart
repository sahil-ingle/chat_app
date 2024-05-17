

import 'package:chat_app/components/my_loading_indicator.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  final void Function()? onTap;

  const LoginPage ({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool loading = false;

  void login(BuildContext context) async{ 

    setState(() {
      loading = true;
    });

    final authService = AuthService();
    

    //login
    try{
      await Future.wait([
        authService.signInWithEmailPassword(
          _emailController.text, 
          _passwordController.text,
        ),
        
      ]);
      setState(() {
        loading = false;
      });
    }
    catch (e){
      setState(() {
        loading = false;
      });
      showDialog(context: context, builder: (context) =>
       AlertDialog( 
        title: Text(
          e.toString()
        )
       )
      );
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          const Icon(Icons.message, size: 100,),
          
          const SizedBox(height: 40,),
        

          const Text("Welcome back User", style: TextStyle(fontSize: 30),),

          const SizedBox(height: 20,),


          MyTextField(
            hintText: "Email",
            obscureText: false,
            controller: _emailController,
          ),

          const SizedBox(height: 10,),

          MyTextField(
            hintText: "Password",
            obscureText: true,
            controller: _passwordController,
          ),

          const SizedBox(height: 20,),

          MyButton( 
            text: "Login",
            onTap: () => login(context),
            ),

            const SizedBox(height: 20,),

            loading ? const MyLoadingIndicator() : Container(),

            const SizedBox(height: 20,),

           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Text("New User ? "),
            GestureDetector(
              onTap: widget.onTap,
              child: const Text("Register here", style: TextStyle(fontWeight: FontWeight.bold),)
              )
          ]),


        ],
        
        ),
      ),
    );
  }
}