// import 'package:endproject/main.dart';
// import 'package:flutter/material.dart';

// import 'Settings.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

// Future<void> changePassword(String newPassword) async {
//   try {
//     User? user = FirebaseAuth.instance.currentUser;
//     await user?.updatePassword(newPassword);
//     print("Password updated successfully!");
//   } catch (error) {
//     print("Error updating password: $error");
//   }
// }

// class ChangePasswordScreen extends StatefulWidget {
//   @override
//   _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
// }

// class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _passwordController = TextEditingController();

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       String newPassword = _passwordController.text;
//       changePassword(newPassword);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Change Password"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(
//                   labelText: "New Password",
//                 ),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "Please enter a new password";
//                   }
//                   if (value.length < 6) {
//                     return "Password must be at least 6 characters long";
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               TextButton(
//                 child: Text("Change Password"),
//                 onPressed: _submitForm,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:endproject/main.dart';
import 'package:flutter/material.dart';

import 'Settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

Future<void> changePassword(String newPassword) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    await user?.updatePassword(newPassword);
    print("Password updated successfully!");
  } catch (error) {
    print("Error updating password: $error");
  }
}

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String newPassword = _passwordController.text;
      changePassword(newPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
        backgroundColor: Color.fromARGB(255, 32, 231, 148),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Password",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter new password",
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a new password";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters long";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text("DONE"),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(
                      255, 36, 36, 36), // Set button background color
                  onPrimary: Colors.white, // Set button text color
                  padding: EdgeInsets.symmetric(
                      vertical: 16.0), // Add vertical padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Add button border radius
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
