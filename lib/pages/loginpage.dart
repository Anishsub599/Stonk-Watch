

import 'package:endproject/pages/signup.dart';
import 'package:endproject/pages/utils.dart';
import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'package:endproject/main.dart';
import 'package:endproject/pages/homepage.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';




class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {


final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
   TextEditingController _emailController = TextEditingController();
   TextEditingController _passwordController = TextEditingController();
   final _auth = FirebaseAuth.instance;

    @override
    void login(){
      _auth.signInWithEmailAndPassword(
        email: _emailController.text,
       password: _passwordController.text.toString()).then((value) {
        utils().toastMessage(value.user!.email.toString());
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>homepage(),));


       }).onError((error, stackTrace){

        utils().toastMessage(error.toString());


       });


    }
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
automaticallyImplyLeading: false,
 title: Text ("LOG In"),
), body: Padding(
padding: const EdgeInsets.symmetric(horizontal: 20), 
child: Column(

mainAxisAlignment: MainAxisAlignment.center, 
crossAxisAlignment: CrossAxisAlignment.center,
children: [
  Form(
    key:_formKey,

    child: Column(
      children: [
         TextField(
             controller: _emailController,
               decoration: InputDecoration(
                 labelText: 'Email',
                 prefixIcon: Icon(Icons.email),
               ),
               

                



),


SizedBox(
  height: 5,
),
 TextField(
             controller: _passwordController,
             obscureText: true,
               decoration: InputDecoration(
                 labelText: 'password',
                 prefixIcon: Icon(Icons.password),
               ),
),






      ],


    ),
    ),
    SizedBox(
      height: 15,
    ),
 
Container(
              width: double.infinity,
               child: RawMaterialButton(
              fillColor: Color.fromARGB(255, 69, 107, 232), 
              elevation: 0.0,

              padding: EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder (
              borderRadius: BorderRadius.circular (12.0)),
              onPressed: (){
                if(_formKey.currentState!.validate()){
                   login();
                    
                }
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>homepage(),));

              },
              child: Text("log in",selectionColor: Colors.black26,),



               ),
),


  SizedBox(

                  height: 20,


            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dont have an account?"),
                TextButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>signup(),));

                }, 
                child: Text('sign up')),
               
              ],
            )

],
),
),
    );



  
  }
}
