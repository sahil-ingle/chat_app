import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context){
      final _auth = AuthService();

      //signup
      if (_passwordController.text == _confirmPasswordController.text){
        try{
          _auth.signUpWithEmailPassword(_emailController.text, _passwordController.text);
        }catch (e){
          showDialog(context: context, builder: (context) =>
            AlertDialog( 
              title: Text(
                e.toString()
              )
            )
            );
        }
      }else{
        showDialog(context: context, builder: (context) =>
       const AlertDialog( 
        title: Text(
          "Password don't match"
        )
       )
      );
      }

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          
              const Icon(Icons.message, size: 100,),
              
              const SizedBox(height: 40,),
            
          
              const Text("Hello User", style: TextStyle(fontSize: 30),),
          
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
          
              const SizedBox(height: 10,),
          
          
              MyTextField(
                hintText: "Confirm Password",
                obscureText: true,
                controller: _confirmPasswordController,
              ),
          
              const SizedBox(height: 20,),
          
              MyButton( 
                text: "Register",
                onTap: () => register(context),
                ),
          
              const SizedBox(height: 20,),
          
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text("Already have an account ? "),
                GestureDetector(
                  onTap: onTap,
                  child: const Text("Login here", style: TextStyle(fontWeight: FontWeight.bold),)
                  )
              ]),
          
            ], 
            ),
          ),
      ),
    );
  }
}