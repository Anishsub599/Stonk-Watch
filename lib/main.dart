// import 'package:endproject/pages/splashscreen.dart';
// import 'package:flutter/material.dart';
// import 'package:endproject/pages/homepage.dart';


// void main() => runApp(Myapp());

// class Myapp extends StatelessWidget {
//   const Myapp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return splashScreen();


 
//   }
// }
// //Anish subedi


import 'package:endproject/pages/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:endproject/pages/homepage.dart';


void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: "Stonk Watch",
      home: splashScreen(),
    );



  }
}
//Anish subedi

