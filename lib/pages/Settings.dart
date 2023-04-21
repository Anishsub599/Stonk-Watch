// import 'package:endproject/pages/theme.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class setting extends StatefulWidget {
//   const setting({super.key});

//   @override
//   State<setting> createState() => _settingState();
// }

// class _settingState extends State<setting> {
//   bool valNotify1 = true;
//   bool valNotify2 = false;
//   bool valNotify3 = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Setting",
//           style: TextStyle(fontSize: 22),
//         ),
//         leading: IconButton(
//           onPressed: () {},
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(10),
//         child: ListView(
//           children: [
//             SizedBox(
//               height: 40,
//             ),
//             Row(
//               children: [
//                 Icon(
//                   Icons.person,
//                   color: Colors.blue,
//                 ),
//                 SizedBox(width: 10),
//                 Text(
//                   "Account",
//                   style: TextStyle(fontSize: 22),
//                 )
//               ],
//             ),
//             Divider(
//               height: 20,
//               thickness: 1,
//             ),
//             SizedBox(height: 10),
//             buildAccountOption(context, "Change Password"),
//             buildAccountOption(context, "Content Settings"),
//             buildAccountOption(context, "Social"),
//             buildAccountOption(context, "Language"),
//             buildAccountOption(context, "Privacy and Security"),
//             SizedBox(height: 40),
//             Row(
//               children: [
//                 Icon(
//                   Icons.volume_up_outlined,
//                   color: Colors.blue,
//                 ),
//                 SizedBox(width: 10),
//                 Text(
//                   "Notifications",
//                   style: TextStyle(fontSize: 22),
//                 )
//               ],
//             ),
//             Divider(
//               height: 20,
//               thickness: 1,
//             ),
//             SizedBox(height: 10),
//             // buildNotificationOption("Theme Dark", valNotify1)
//           ],
//         ),
//       ),
//     );
//   }

//   // Padding buildNotificationOption(
//   //     String title, bool value, Function onChangeMethod) {
//   //   return Padding(
//   //     padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //       children: [
//   //         Text(title,
//   //             style: TextStyle(
//   //                 fontSize: 20,
//   //                 fontWeight: FontWeight.w500,
//   //                 color: Colors.grey[600])),
//   //         Transform.scale(
//   //           scale: 0.7,
//   //           child: CupertinoSwitch(
//   //               activeColor: Colors.blue,
//   //               trackColor: Colors.grey,
//   //               value: value,
//   //               onChanged: (bool newValue) {
//   //                 onChangeMethod(newValue);
//   //               }),
//   //         )
//   //       ],
//   //     ),
//   //   );

//   GestureDetector buildAccountOption(BuildContext context, String title) {
//     return GestureDetector(
//       onTap: () {
//         showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text(title),
//                 content: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [

//                   ],
//                 ),
//                 actions: [
//                   TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Text("Close")),
//                 ],
//               );
//             });
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(title,
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.grey[600])),
//             Icon(Icons.arrow_forward_ios),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:endproject/pages/changepass.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 57,
                  padding: EdgeInsets.only(left: 18),
                  width: 200,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "General",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  decoration: BoxDecoration(
                      // border: Border.all(color: Colors.white)
                      ),
                ),
                SizedBox(
                  width: 200,
                )
              ],
            ),
            Container(
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 105, 82, 210),
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangePasswordScreen(),
                      ));
                },
                child: const Text('Change password'),
              ),
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),
            Container(
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 105, 82, 210),
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                child: const Text('Content setting'),
              ),
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),
            Container(
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 105, 82, 210),
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                child: const Text('Social'),
              ),
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),
            Container(
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 105, 82, 210),
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                child: const Text('Privacy and security'),
              ),
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),
            Container(
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 105, 82, 210),
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                child: const Text('Notifications'),
              ),
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),
            Container(
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 105, 82, 210),
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                child: const Text('Language setting'),
              ),
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),
            SizedBox(
              height: 19,
            ),
          ],
        ),
      ),
    );
  }
}
