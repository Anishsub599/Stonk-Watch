// import 'package:flutter/material.dart';
// import 'package:cupertino_icons/cupertino_icons.dart';
// import 'dart:async';

// class splashScreen extends StatefulWidget {
//   const splashScreen({super.key});

//   @override
//   State<splashScreen> createState() => _splashScreenState();
// }

// class _splashScreenState extends State<splashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 75, 183, 113),
//       body: Container(
//           height: 40,
//           width: 40,
//           alignment: AlignmentDirectional(40, 30),
//           child: Text("splash screen"),
          



      
//       )
//     );
//   }
// }



import 'package:endproject/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'dart:async';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homepage(),));
     });
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 14, 14),
      body: Container(
          height: 40,
          width: 40,
          alignment: AlignmentDirectional(40, 30),
          child: Text("splash screen"),
          



      
      )
    );
  }
}