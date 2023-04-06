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

<<<<<<< HEAD
 
=======
>>>>>>> refs/remotes/origin/master
import 'package:endproject/pages/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:endproject/pages/homepage.dart';
import 'package:endproject/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

<<<<<<< HEAD




void main() async{
   
  WidgetsFlutterBinding.ensureInitialized();
 Firebase.initializeApp();
//  options: DefaultFirebaseOptions.currentPlatform
  
  
  runApp(const Myapp());

}

=======
void main() => runApp(Myapp());
>>>>>>> refs/remotes/origin/master

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
//Gaurav Chataut

