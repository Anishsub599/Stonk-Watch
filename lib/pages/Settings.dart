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
import 'package:endproject/pages/privacy.dart';
import 'package:endproject/pages/social.dart';
import 'package:endproject/pages/sound.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF40535B),
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Color(0xFF3A526E),
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                "General",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(height: 16),
              buildSettingItem(
                context,
                text: 'Change password',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePasswordScreen(),
                    ),
                  );
                },
              ),
              buildSettingItem(
                context,
                text: 'Sound setting',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SoundSettingsPage(),
                    ),
                  );
                },
              ),
              buildSettingItem(
                context,
                text: 'Social',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SocialPage(),
                    ),
                  );
                },
              ),
              buildSettingItem(
                context,
                text: 'Privacy and security',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrivacySecurityPage(),
                    ),
                  );
                },
              ),
              buildSettingItem(
                context,
                text: 'Notifications',
                onPressed: () {},
              ),
              buildSettingItem(
                context,
                text: 'Language setting',
                onPressed: () {},
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSettingItem(BuildContext context,
      {required String text, VoidCallback? onPressed}) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(30),
        color: Color(0xFF576B7C),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Color(0xFFC4E1E8),
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              CupertinoIcons.right_chevron,
              color: Color(0xFFC4E1E8),
            ),
          ],
        ),
      ),
    );
  }
}
