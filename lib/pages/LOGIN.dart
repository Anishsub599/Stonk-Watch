// // ignore_for_file: prefer_const_constructors, use_build_context_synchronously

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/gestures.dart';

// // bool _obscure = true;

// // class Login extends StatefulWidget {
// //   const Login({Key? key}) : super(key: key);

// //   @override
// //   State<Login> createState() => _LoginState();
// // }

// // class _LoginState extends State<Login> {
// //   TextEditingController emailController = TextEditingController();
// //   TextEditingController passwordController = TextEditingController();

// //   void loginAttempt() async {
// //     String email = emailController.text.trim();
// //     String password = passwordController.text.trim();
// //     UserCredential? credential;

// //     try {
// //       credential = await FirebaseAuth.instance
// //           .signInWithEmailAndPassword(email: email, password: password);
// //     } on FirebaseAuthException catch (ex) {
// //       Navigator.pop(context);
// //       // Close the loading dialog
// //       print(ex.toString());
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //           content: Text("Invalid Credentials"),
// //         ),
// //       );
// //     }

// //     if (credential != null) {
// //       String uid = credential.user!.uid;

// //       UIHelper.showLoadingDialog(context, "Logging In..");

// //       DocumentSnapshot userData =
// //           await FirebaseFirestore.instance.collection('users').doc(uid).get();
// //       UserModel userModel =
// //           UserModel.fromMap(userData.data() as Map<String, dynamic>);

// //       // Go to HomePage
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //           content: Text("Log In Successful!"),
// //         ),
// //       );
// //       //
// //       Navigator.popUntil(context, (route) => route.isFirst);
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(builder: (context) {
// //           /* return AccountSetting(
// //             user: userModel,
// //           );*/
// //           return MyHomePage(user: userModel);
// //         }),
// //       );
// //     }
// //   }

// import 'dart:math';

// import 'package:endproject/pages/signup.dart';
// import 'package:endproject/pages/startingpage.dart';
// import 'package:endproject/pages/utils.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'splashscreen.dart';
// import 'package:endproject/main.dart';
// import 'package:endproject/pages/homepage.dart';
// import 'package:cupertino_icons/cupertino_icons.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'utils.dart';

// class loginpage extends StatefulWidget {
//   const loginpage({super.key});

//   @override
//   State<loginpage> createState() => _loginpageState();
// }

// class _loginpageState extends State<loginpage> {
//   bool loading = false;
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   FirebaseAuth _auth = FirebaseAuth.instance;

//   void login() async {
//     _auth
//         .signInWithEmailAndPassword(
//             email: _emailController.text,
//             password: _passwordController.text.toString())
//         .then((value) {
//       utils().toastMessage(value.user!.email.toString());
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => homepage(),
//           ));
//     }).onError((error, stackTrace) {
//       debugPrint(error.toString());

//       utils().toastMessage(error.toString());
//       // setState(() {
//       //   loading= false;
//       // });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         toolbarHeight: 45,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => LandingPage()),
//             );
//           },
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: SingleChildScrollView(
//             child: Column(children: [
//               // const Image(
//               //   image: AssetImage(appIcon),
//               //   height: 100,
//               // ),
//               const Text(
//                 'Welcome back User!!!',
//                 style: TextStyle(
//                   fontStyle: FontStyle.italic,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.amber,
//                 ),
//               ),
//               SizedBox(
//                 height: 300,
//                 width: 350,
//                 child:
//                     Image(image: AssetImage("assets/fonts/images/stock.jpg")),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Wrap(
//                   runSpacing: 12.0,
//                   children: [
//                     Form(
//                       key: _formKey,
//                       child: Column(
//                         children: [
//                           TextFormField(
//                             controller: _emailController,
//                             decoration: InputDecoration(
//                               labelText: 'Email',
//                               prefixIcon: Icon(Icons.email),
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "Enter email.";
//                               }
//                             },
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           TextFormField(
//                             controller: _passwordController,
//                             obscureText: true,
//                             decoration: const InputDecoration(
//                               suffixIcon: Material(
//                                 color: Colors.transparent,
//                               ),
//                               labelText: 'password',
//                               prefixIcon: Icon(Icons.password),
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Enter password.';
//                               }
//                               return null;
//                             },
//                           ),
//                           SizedBox(
//                             height: 30,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text("Don't have an account?"),
//                               TextButton(
//                                   onPressed: () {
//                                     Navigator.pushReplacement(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) => signup(),
//                                         ));
//                                   },
//                                   child: Text('Sign up'))
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Container(
//                       width: double.infinity,
//                       child: RawMaterialButton(
//                         fillColor: Color.fromARGB(255, 69, 107, 232),
//                         elevation: 0.0,
//                         padding: EdgeInsets.symmetric(vertical: 20),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12.0)),
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             _formKey.currentState?.save();
//                             login();
//                           }
//                         },
//                         child: Text(
//                           "log in",
//                           selectionColor: Colors.black26,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Container(
//                 width: double.infinity,
//                 child: RawMaterialButton(
//                   textStyle: TextStyle(),
//                   fillColor: Color.fromARGB(255, 21, 21, 21),
//                   elevation: 0.0,
//                   padding: EdgeInsets.symmetric(vertical: 20),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12.0)),
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       _formKey.currentState?.save();
//                       login();
//                     }
//                   },
//                   child: Text(
//                     "log in",
//                     selectionColor: Colors.black26,
//                   ),
//                 ),
//               ),
//               RichText(
//                 text: TextSpan(
//                   text: "By signing up you will be accepting our ",
//                   style: TextStyle(color: Colors.black),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: 'Terms and Conditions',
//                         style: TextStyle(
//                             color: Colors.blue,
//                             decoration: TextDecoration.underline),
//                         recognizer: TapGestureRecognizer()..onTap = () {}),
//                   ],
//                 ),
//               ),
//             ]),
//           )),
//     );
//   }
// }

 
//                     //SEE: myTextField.dart
//               //       myTextField(
//               //           text: 'Email',
//               //           fieldController: emailController,
//               //           label: 'Email',
//               //           obscure: false),

//               //       TextField(
//               //         decoration: InputDecoration(
//               //           suffixIcon: Material(
//               //             color: Colors.transparent,
//               //             child: IconButton(
//               //               onPressed: () {
//               //                 setState(() {
//               //                   _obscure = !_obscure;
//               //                 });
//               //               },
//               //               icon: Icon((_obscure == true)
//               //                   ? Icons.visibility
//               //                   : Icons.visibility_off),
//               //             ),
//               //           ),
//               //           hintText: 'Password',
//               //           labelText: 'Password',
//               //           contentPadding: const EdgeInsets.symmetric(
//               //             vertical: 16.0,
//               //             horizontal: 10.0,
//               //           ),
//               //           border: OutlineInputBorder(
//               //             borderRadius: BorderRadius.circular(10),
//               //           ),
//               //         ),
//               //         obscureText: _obscure,
//               //         controller: passwordController,
//               //         style: const TextStyle(fontSize: 12.0),
//               //       )
//               //     ],
//               //   ),
//               // ),
//               // const SizedBox(
//               //   height: 30.0,
//               // ),
//               // ElevatedButton(
//               //   style: ElevatedButton.styleFrom(
//               //     backgroundColor: Colors.blue.shade400,
//               //   ),
//               //   onPressed: () {
//               //     loginAttempt();
//               //     // final result = await AuthService().SignIn(
//               //     //     emailText: emailController.text,
//               //     //     passwordText: passwordController.text);
//               //     // if (result!.contains('success')) {
//               //     //   Navigator.push(
//               //     //     context,
//               //     //     MaterialPageRoute(
//               //     //       builder: ((context) => AccountSetting(
//               //     //             email: emailController.text,
//               //     //           )),
//               //     //     ),
//               //     //   );
//               //     // }
//               //     // else{
//               //     //   ScaffoldMessenger.of(context).showSnackBar(
//               //     //     const SnackBar(
//               //     //       content: Text('Invalid Email or Password'),
//               //     //     ),
//               //     //   );
//               //     // }
//               //   },
// //                 child: const Padding(
// //                   padding: EdgeInsets.only(
// //                       top: 16.0, bottom: 16.0, right: 30.0, left: 30.0),
// //                   child: Text('Login'),
// //                 ),
// //               ),
// //               SizedBox(
// //                 height: 50,
// //               ),
// //               RichText(
// //                 text: TextSpan(
// //                   text: "By signing up you will be accepting our ",
// //                   style: TextStyle(color: Colors.black),
// //                   children: <TextSpan>[
// //                     TextSpan(
// //                         text: 'Terms and Conditions',
// //                         style: TextStyle(
// //                             color: Colors.blue,
// //                             decoration: TextDecoration.underline),
// //                         recognizer: TapGestureRecognizer()..onTap = () {}),
// //                     const TextSpan(
// //                       text: '.',
// //                       style: TextStyle(color: Colors.black),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ), //, This trailing comma makes auto-formatting nicer for build methods.
// //     );
// //   }
// // }
