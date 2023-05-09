// import 'Settings.dart';

// import 'package:flutter/material.dart';
// import 'package:cupertino_icons/cupertino_icons.dart';
// import 'package:url_launcher/url_launcher.dart';

// class SocialPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 80, 237, 172),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(159, 68, 213, 32),
//         title: Text('Social'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Connect with Us',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16),
//             ListTile(
//               leading: Icon(Icons.email),
//               title: Text('Email'),
//               subtitle: Text('support@example.com'),
//               onTap: () {
//                 // open email app with pre-filled fields
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.phone),
//               title: Text('Phone'),
//               subtitle: Text('+977 9848564540'),
//               onTap: () {
//                 // call phone number
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.public),
//               title: Text('Website'),
//               subtitle: Text('anishsubedi599@gmail.com'),
//               onTap: () {},
//             ),
//             SizedBox(height: 32),
//             Text(
//               'Follow Us',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16),
//             ListTile(
//               leading: Icon(Icons.facebook),
//               title: Text('Facebook'),
//               subtitle: Text('facebook.com/example'),
//               onTap: () {
//                 final Uri _url =
//                     Uri.parse('https://www.facebook.com/anish.subedi.372');
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.link),
//               title: Text('Twitter'),
//               subtitle: Text('twitter.com/example'),
//               onTap: () {
//                 final Uri _url = Uri.parse('https://twitter.com/OSCARREBEL3');
//                 //  https://twitter.com/OSCARREBEL3
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.link),
//               title: Text('Instagram'),
//               subtitle: Text('instagram.com/example'),
//               onTap: () {
//                 final Uri _url =
//                     Uri.parse('https://www.instagram.com/0scar.rebel/');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'Settings.dart';

import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 235, 239, 238), // Set a vibrant background color
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 110, 205,
            226), // Set a darker shade of the background color for the app bar
        title: Text('Social'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Connect with Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('support@example.com'),
              onTap: () {
                // open email app with pre-filled fields
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('+977 9848564540'),
              onTap: () {
                // call phone number
              },
            ),
            ListTile(
              leading: Icon(Icons.public),
              title: Text('Website'),
              subtitle: Text('anishsubedi599@gmail.com'),
              onTap: () {},
            ),
            SizedBox(height: 32),
            Text(
              'Follow Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.facebook),
              title: Text('Facebook'),
              subtitle: Text('facebook.com/example'),
              onTap: () {
                final Uri _url =
                    Uri.parse('https://www.facebook.com/anish.subedi.372');
                // Open the Facebook URL in a web browser
              },
            ),
            ListTile(
              leading: Icon(Icons.link),
              title: Text('Twitter'),
              subtitle: Text('twitter.com/example'),
              onTap: () {
                final Uri _url = Uri.parse('https://twitter.com/OSCARREBEL3');
                // Open the Twitter URL in a web browser
              },
            ),
            ListTile(
              leading: Icon(Icons.link),
              title: Text('Instagram'),
              subtitle: Text('instagram.com/example'),
              onTap: () {
                final Uri _url =
                    Uri.parse('https://www.instagram.com/0scar.rebel/');
                // Open the Instagram URL in a web browser
              },
            ),
          ],
        ),
      ),
    );
  }
}
