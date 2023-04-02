

import 'package:endproject/pages/utils.dart';
import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'package:endproject/main.dart';
import 'package:endproject/pages/homepage.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'loginpage.dart';


// class SignupPage extends StatefulWidget {



//   @override
//   _SignupPageState createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
  

// FirebaseAuth _auth = FirebaseAuth.instance;



//   @override
//   Widget build(BuildContext context) {
//      return Scaffold(
//       appBar: AppBar(
//         title: Text('Signup'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(
//                 labelText: 'Name',
//               ),
//             ),
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//               ),
//               obscureText: true,
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             Container(
//               width: double.infinity,
//                child: RawMaterialButton(
//               fillColor: Color.fromARGB(255, 69, 107, 232), 
//               elevation: 0.0,

//               padding: EdgeInsets.symmetric(vertical: 20),
//               shape: RoundedRectangleBorder (
//               borderRadius: BorderRadius.circular (12.0)),
//               onPressed: (){
//                 if(_formKey.currentState!.validate()){
//                     _auth.createUserWithEmailAndPassword(
//                         email: _emailController.text.toString(),
//                         password: _passwordController.text.toString(),
                

//                     );
//                 }

//                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyCustomForm(),));

//               },
//               child: Text("Sign in",selectionColor: Colors.black26,),
                


//                ),
               
//             ),
           

            
//           ],
//         ),
//       ),
//      );
//   }
// }


  class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool loading = false;
final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
   TextEditingController _emailController = TextEditingController();
   TextEditingController _passwordController = TextEditingController();
   
   FirebaseAuth _auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
automaticallyImplyLeading: false,
 title: Text ("Sign In"),
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
              //  validator: (value){
              //   if(value!.isEmpty){
              //     return'Enter email';

              //   }
              //   return null;

              //  },
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
                  setState(() {
                    loading = true;
                  });
                  _auth.createUserWithEmailAndPassword
                  (email: _emailController.text.toString(),
                  password:_passwordController.text.toString()
                   ).then((value){
                    setState(() {
                      loading = false;
                    });


                   }).onError((error, stackTrace) {
                    utils().toastMessage(error.toString());

 
                   });


                   
                   
                    
                }
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>loginpage(),));


              },
              child: Text("Sign in",selectionColor: Colors.black26,),



               ),
),
            
],
),
),
    );



  
  }
}