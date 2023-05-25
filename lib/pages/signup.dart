// // import 'dart:math';

// // import 'package:endproject/pages/utils.dart';
// // import 'package:flutter/material.dart';
// // import 'splashscreen.dart';
// // import 'package:endproject/main.dart';
// // import 'package:endproject/pages/homepage.dart';
// // import 'package:cupertino_icons/cupertino_icons.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'loginpage.dart';

// // // NEXT CODE
// // // class signup extends StatefulWidget {
// // //   const signup({super.key});

// // //   @override
// // //   State<signup> createState() => _signupState();
// // // }

// // // class _signupState extends State<signup> {
// // //   bool loading = false;
// // //   final _formKey = GlobalKey<FormState>();
// // //   TextEditingController _nameController = TextEditingController();
// // //   TextEditingController _emailController = TextEditingController();
// // //   TextEditingController _passwordController = TextEditingController();

// // //   FirebaseAuth _auth = FirebaseAuth.instance;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         automaticallyImplyLeading: false,
// // //         title: Text("Sign In"),
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.symmetric(horizontal: 20),
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           crossAxisAlignment: CrossAxisAlignment.center,
// // //           children: [
// // //             Form(
// // //               key: _formKey,
// // //               child: Column(
// // //                 children: [
// // //                   SizedBox(
// // //                     height: 180,
// // //                   ),
// // //                   TextField(
// // //                     decoration: InputDecoration(
// // //                       labelText: 'First Name',
// // //                       prefixIcon: Icon(Icons.person),
// // //                     ),
// // //                   ),
// // //                   TextField(
// // //                     decoration: InputDecoration(
// // //                       labelText: 'Last Name',
// // //                       prefixIcon: Icon(Icons.person),
// // //                     ),
// // //                   ),
// // //                   TextField(
// // //                     controller: _emailController,
// // //                     decoration: InputDecoration(
// // //                       labelText: 'Email',
// // //                       prefixIcon: Icon(Icons.email),
// // //                     ),
// // //                   ),
// // //                   SizedBox(
// // //                     height: 5,
// // //                   ),
// // //                   TextField(
// // //                     controller: _passwordController,
// // //                     obscureText: true,
// // //                     decoration: InputDecoration(
// // //                       labelText: 'password',
// // //                       prefixIcon: Icon(Icons.password),
// // //                     ),
// // //                     //  validator: (value){
// // //                     //   if(value!.isEmpty){
// // //                     //     return'Enter email';

// // //                     //   }
// // //                     //   return null;

// // //                     //  },
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //             SizedBox(
// // //               height: 15,
// // //             ),
// // //             Row(
// // //               mainAxisAlignment: MainAxisAlignment.center,
// // //               children: [
// // //                 Text("Already have an account?"),
// // //                 TextButton(
// // //                   onPressed: () {
// // //                     Navigator.pushReplacement(
// // //                         context,
// // //                         MaterialPageRoute(
// // //                           builder: (context) => loginpage(),
// // //                         ));
// // //                   },
// // //                   child: Text("Sign in"),
// // //                 ),
// // //               ],
// // //             ),
// // //             Container(
// // //               width: double.infinity,
// // //               child: RawMaterialButton(
// // //                 fillColor: Color.fromARGB(255, 69, 107, 232),
// // //                 elevation: 0.0,
// // //                 padding: EdgeInsets.symmetric(vertical: 20),
// // //                 shape: RoundedRectangleBorder(
// // //                     borderRadius: BorderRadius.circular(12.0)),
// // //                 onPressed: () {
// // //                   if (_formKey.currentState!.validate()) {
// // //                     setState(() {
// // //                       loading = true;
// // //                     });
// // //                     _auth
// // //                         .createUserWithEmailAndPassword(
// // //                             email: _emailController.text.toString(),
// // //                             password: _passwordController.text.toString())
// // //                         .then((value) {
// // //                       setState(() {
// // //                         loading = false;
// // //                       });
// // //                     }).onError((error, stackTrace) {
// // //                       utils().toastMessage(error.toString());
// // //                     });
// // //                   }
// // //                   Navigator.pushReplacement(
// // //                       context,
// // //                       MaterialPageRoute(
// // //                         builder: (context) => loginpage(),
// // //                       ));
// // //                 },
// // //                 child: Text(
// // //                   "Sign in",
// // //                   selectionColor: Colors.black26,
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // new code

// // class SignupPage extends StatefulWidget {
// //   @override
// //   _SignupPageState createState() => _SignupPageState();
// // }

// // class _SignupPageState extends State<SignupPage> {
// //   final _formKey = GlobalKey<FormState>();
// //   TextEditingController _firstNameController = TextEditingController();
// //   TextEditingController _lastNameController = TextEditingController();
// //   TextEditingController _emailController = TextEditingController();
// //   TextEditingController _passwordController = TextEditingController();

// //   FirebaseAuth _auth = FirebaseAuth.instance;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Color.fromARGB(
// //             255, 160, 234, 220), // Set the background color of the app bar
// //         title: Text(
// //           'Sign Up',
// //           style: TextStyle(
// //               color: Colors.black,
// //               fontFamily: 'kanit.tff' // Set the text color of the app bar title
// //               ),
// //         ),
// //         centerTitle: true,
// //         elevation: 0, // Remove the app bar elevation
// //       ),
// //       body: Container(
// //         color: Color.fromARGB(
// //             255, 162, 235, 206), // Set the background color of the body
// //         padding: EdgeInsets.symmetric(horizontal: 20),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             Form(
// //               key: _formKey,
// //               child: Column(
// //                 children: [
// //                   SizedBox(
// //                     height: 180,
// //                   ),
// //                   TextFormField(
// //                     controller: _firstNameController,
// //                     decoration: InputDecoration(
// //                       labelText: 'First Name',
// //                       prefixIcon: Icon(Icons.person),
// //                       border: OutlineInputBorder(
// //                         borderSide: BorderSide(color: Colors.black),
// //                       ),
// //                       focusedBorder: OutlineInputBorder(
// //                         borderSide: BorderSide(color: Colors.black),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(height: 10),
// //                   TextFormField(
// //                     controller: _lastNameController,
// //                     decoration: InputDecoration(
// //                       labelText: 'Last Name',
// //                       prefixIcon: Icon(Icons.person),
// //                       border: OutlineInputBorder(
// //                         borderSide: BorderSide(color: Colors.black),
// //                       ),
// //                       focusedBorder: OutlineInputBorder(
// //                         borderSide: BorderSide(color: Colors.black),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(height: 10),
// //                   TextFormField(
// //                     controller: _emailController,
// //                     decoration: InputDecoration(
// //                       labelText: 'Email',
// //                       prefixIcon: Icon(Icons.email),
// //                       border: OutlineInputBorder(
// //                         borderSide: BorderSide(color: Colors.black),
// //                       ),
// //                       focusedBorder: OutlineInputBorder(
// //                         borderSide: BorderSide(color: Colors.black),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(height: 10),
// //                   TextFormField(
// //                     controller: _passwordController,
// //                     obscureText: true,
// //                     decoration: InputDecoration(
// //                       labelText: 'Password',
// //                       prefixIcon: Icon(Icons.password),
// //                       border: OutlineInputBorder(
// //                         borderSide: BorderSide(color: Colors.black),
// //                       ),
// //                       focusedBorder: OutlineInputBorder(
// //                         borderSide: BorderSide(color: Colors.black),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             SizedBox(height: 15),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Text("Already have an account?"),
// //                 TextButton(
// //                   onPressed: () {
// //                     Navigator.pushReplacement(
// //                       context,
// //                       MaterialPageRoute(builder: (context) => loginpage()),
// //                     );
// //                   },
// //                   child: Text("Sign In"),
// //                 ),
// //               ],
// //             ),
// //             Container(
// //               width: double.infinity,
// //               child: ElevatedButton(
// //                 style: ElevatedButton.styleFrom(
// //                   primary: Colors.black, // Set the button background color
// //                   onPrimary: Colors.white, // Set the button text color
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(12.0),
// //                   ),
// //                 ),
// //                 onPressed: () {
// //                   if (_formKey.currentState!.validate()) {
// //                     _auth
// //                         .createUserWithEmailAndPassword(
// //                       email: _emailController.text.toString(),
// //                       password: _passwordController.text.toString(),
// //                     )
// //                         .then((value) {
// //                       // User creation success
// //                       Navigator.pushReplacement(
// //                         context,
// //                         MaterialPageRoute(builder: (context) => loginpage()),
// //                       );
// //                     }).catchError((error) {
// //                       // Error creating user
// //                       utils().toastMessage(error.toString());
// //                     });
// //                   }
// //                 },
// //                 child: Text(
// //                   "Sign Up",
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// // next code

// // import 'package:endproject/pages/loginpage.dart';
// // import 'package:endproject/pages/utils.dart';
// // import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';

// // class SignupPage extends StatefulWidget {
// //   @override
// //   _SignupPageState createState() => _SignupPageState();
// // }

// // class _SignupPageState extends State<SignupPage> {
// //   final _formKey = GlobalKey<FormState>();
// //   TextEditingController _firstNameController = TextEditingController();
// //   TextEditingController _lastNameController = TextEditingController();
// //   TextEditingController _emailController = TextEditingController();
// //   TextEditingController _passwordController = TextEditingController();

// //   FirebaseAuth _auth = FirebaseAuth.instance;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           Container(
// //             decoration: BoxDecoration(
// //               gradient: LinearGradient(
// //                 begin: Alignment.topCenter,
// //                 end: Alignment.bottomCenter,
// //                 colors: [
// //                   Color.fromARGB(255, 123, 230, 212)!,
// //                   Color.fromARGB(255, 127, 222, 173)!,
// //                 ],
// //               ),
// //             ),
// //           ),
// //           Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               SizedBox(height: 50),
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 20),
// //                 child: Text(
// //                   'Sign Up',
// //                   style: TextStyle(
// //                     fontSize: 24,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.black,
// //                   ),
// //                 ),
// //               ),
// //               Expanded(
// //                 child: Container(
// //                   margin: EdgeInsets.only(top: 30),
// //                   decoration: BoxDecoration(
// //                     color: Colors.white,
// //                     borderRadius: BorderRadius.only(
// //                       topLeft: Radius.circular(30),
// //                       topRight: Radius.circular(30),
// //                     ),
// //                   ),
// //                   child: SingleChildScrollView(
// //                     child: Padding(
// //                       padding: const EdgeInsets.all(20.0),
// //                       child: Column(
// //                         children: [
// //                           Form(
// //                             key: _formKey,
// //                             child: Column(
// //                               children: [
// //                                 TextFormField(
// //                                   controller: _firstNameController,
// //                                   decoration: InputDecoration(
// //                                     labelText: 'First Name',
// //                                     prefixIcon: Icon(Icons.person),
// //                                     border: OutlineInputBorder(
// //                                       borderSide:
// //                                           BorderSide(color: Colors.black),
// //                                     ),
// //                                     focusedBorder: OutlineInputBorder(
// //                                       borderSide:
// //                                           BorderSide(color: Colors.black),
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 SizedBox(height: 10),
// //                                 TextFormField(
// //                                   controller: _lastNameController,
// //                                   decoration: InputDecoration(
// //                                     labelText: 'Last Name',
// //                                     prefixIcon: Icon(Icons.person),
// //                                     border: OutlineInputBorder(
// //                                       borderSide:
// //                                           BorderSide(color: Colors.black),
// //                                     ),
// //                                     focusedBorder: OutlineInputBorder(
// //                                       borderSide:
// //                                           BorderSide(color: Colors.black),
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 SizedBox(height: 10),
// //                                 TextFormField(
// //                                   controller: _emailController,
// //                                   decoration: InputDecoration(
// //                                     labelText: 'Email',
// //                                     prefixIcon: Icon(Icons.email),
// //                                     border: OutlineInputBorder(
// //                                       borderSide:
// //                                           BorderSide(color: Colors.black),
// //                                     ),
// //                                     focusedBorder: OutlineInputBorder(
// //                                       borderSide:
// //                                           BorderSide(color: Colors.black),
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 SizedBox(height: 10),
// //                                 TextFormField(
// //                                   controller: _passwordController,
// //                                   obscureText: true,
// //                                   decoration: InputDecoration(
// //                                     labelText: 'Password',
// //                                     prefixIcon: Icon(Icons.password),
// //                                     border: OutlineInputBorder(
// //                                       borderSide:
// //                                           BorderSide(color: Colors.black),
// //                                     ),
// //                                     focusedBorder: OutlineInputBorder(
// //                                       borderSide:
// //                                           BorderSide(color: Colors.black),
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                           SizedBox(height: 15),
// //                           Row(
// //                             mainAxisAlignment: MainAxisAlignment.center,
// //                             children: [
// //                               Text("Already have an account?"),
// //                               TextButton(
// //                                 onPressed: () {
// //                                   Navigator.pushReplacement(
// //                                     context,
// //                                     MaterialPageRoute(
// //                                         builder: (context) => loginpage()),
// //                                   );
// //                                 },
// //                                 child: Text("Sign In"),
// //                               ),
// //                             ],
// //                           ),
// //                           Container(
// //                             width: double.infinity,
// //                             child: ElevatedButton(
// //                               style: ElevatedButton.styleFrom(
// //                                 primary: Colors.black,
// //                                 shape: RoundedRectangleBorder(
// //                                   borderRadius: BorderRadius.circular(12.0),
// //                                 ),
// //                               ),
// //                               onPressed: () {
// //                                 if (_formKey.currentState!.validate()) {
// //                                   _auth
// //                                       .createUserWithEmailAndPassword(
// //                                     email: _emailController.text.toString(),
// //                                     password:
// //                                         _passwordController.text.toString(),
// //                                   )
// //                                       .then((value) {
// //                                     // User created successfully
// //                                   }).catchError((error) {
// //                                     utils().toastMessage(error.toString());
// //                                   });
// //                                 }
// //                                 Navigator.pushReplacement(
// //                                   context,
// //                                   MaterialPageRoute(
// //                                       builder: (context) => loginpage()),
// //                                 );
// //                               },
// //                               child: Padding(
// //                                 padding:
// //                                     const EdgeInsets.symmetric(vertical: 16.0),
// //                                 child: Text(
// //                                   "Sign Up",
// //                                   style: TextStyle(fontSize: 18),
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // class LoginPage extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         automaticallyImplyLeading: false,
// // //         title: Text("Sign In"),
// // //         shape: RoundedRectangleBorder(
// // //           borderRadius: BorderRadius.vertical(
// // //             bottom: Radius.circular(30),
// // //           ),
// // //         ),
// // //       ),
// // //       body: Container(
// // //         color: Colors.white,
// // //         child: Center(
// // //           child: Text(
// // //             "Login Page",
// // //             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class MyCustomForm extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text("Form Page"),
// // //       ),
// // //       body: Container(
// // //         color: Colors.white,
// // //         child: Center(
// // //           child: Text(
// // //             "Form Page",
// // //             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class utils {
// // //   void toastMessage(String message) {
// // //     // Implement your toast message logic here
// // //   }
// // // }
// // NEXT part

import 'package:endproject/pages/loginpage.dart';
import 'package:endproject/pages/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:endproject/pages/utils.dart';

import 'splashscreen.dart';
import 'package:endproject/main.dart';
import 'package:endproject/pages/homepage.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'loginpage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 207, 240, 231)!,
                  Color.fromARGB(255, 216, 250, 239)!,
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Rubik Puddles',
                    color: Color.fromARGB(255, 59, 56, 56),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            'Create Account',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'Rubik Puddles',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(95, 10, 10, 10),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'First Name',
                                      prefixIcon: Icon(Icons.person),
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Last Name',
                                      prefixIcon: Icon(Icons.person),
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      prefixIcon: Icon(Icons.email),
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: TextFormField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      prefixIcon: Icon(Icons.password),
                                      fillColor:
                                          Color.fromARGB(255, 236, 229, 229),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => loginpage(),
                                    ),
                                  );
                                },
                                child: Text("Sign in"),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 155, 233, 233),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  _auth
                                      .createUserWithEmailAndPassword(
                                    email: _emailController.text.toString(),
                                    password:
                                        _passwordController.text.toString(),
                                  )
                                      .then((value) {
                                    setState(() {
                                      loading = false;
                                    });
                                    // User created successfully
                                  }).onError((error, stackTrace) {
                                    utils().toastMessage(error.toString());
                                  });
                                }
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => loginpage()),
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
