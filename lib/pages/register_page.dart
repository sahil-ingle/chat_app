import 'package:chat_app/components/my_loading_indicator.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  bool loading = false;

  Future<void> register(BuildContext context) async {
    setState(() {
        loading = true;
      });
      final _auth = AuthService();

      if (_emailController.text.isEmpty & _passwordController.text.isEmpty & _nameController.text.isEmpty){
          showDialog(context: context, builder: (context) =>
            const AlertDialog( 
                title: Text(
                  "Fill all the fields"
                )
              )
          );
          setState(() {
        loading = false;
      });

      }else{

  
      //signup
      if (_passwordController.text == _confirmPasswordController.text){
        try{
          await Future.wait([
          _auth.signUpWithEmailPassword(_emailController.text, _nameController.text, _passwordController.text)
          ]);
          setState(() {
        loading = false;
      });
        }catch (e){
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
      }else{
        setState(() {
        loading = false;
      });
        showDialog(context: context, builder: (context) =>
       const AlertDialog( 
        title: Text(
          "Password don't match"
        )
       )
      );
      }
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
                hintText: "Name",
                obscureText: false,
                controller: _nameController,
              ),

              const SizedBox(height: 10,),
          
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

              loading ? const MyLoadingIndicator() : Container(),

              const SizedBox(height: 20,),
          
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text("Already have an account ? "),
                GestureDetector(
                  onTap: widget.onTap,
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