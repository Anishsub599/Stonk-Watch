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

import 'dart:math';

import 'package:endproject/pages/homepage.dart';
import 'package:endproject/pages/loginpage.dart';
import 'package:endproject/pages/startingpage.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LandingPage(),
          ));
    });
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 14, 14),
      body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Container(
                //           height:double.infinity,
                //           width:double.infinity,

                //       decoration: BoxDecoration(
                //           // border: Border.all(color: Colors.black),
                // image: DecorationImage(
                //     image: AssetImage("assets/fonts/images/stonk.png"),
                //     fit: BoxFit.cover)),

                //  ),
                SizedBox(
                  height: 200,
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: Color.fromARGB(255, 18, 184, 40)),
                      image: DecorationImage(
                          image: AssetImage("assets/fonts/images/stonkpic.png"),
                          fit: BoxFit.fill)),
                ),

                SizedBox(
                  height: 40,
                ),

                Container(
                  height: 50,
                  width: 200,
                  child: Text(
                    "Stonk Watch",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 117, 205, 121),
                        fontFamily: "kanit"),
                  ),
                ),
                CircularProgressIndicator.adaptive(
                  backgroundColor: Color.fromARGB(255, 243, 220, 235),
                  strokeWidth: 5,
                )
              ],
            ),
          )),
    );
  }
}
