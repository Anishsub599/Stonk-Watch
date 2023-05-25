import 'Settings.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class myprofile extends StatefulWidget {
  myprofile({super.key});

  @override
  State<myprofile> createState() => _myprofileState();
}

class _myprofileState extends State<myprofile> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  String userEmail = FirebaseAuth.instance.currentUser!.email!;
  String userName = 'KUSHAL '; // replace with the user's actual name
  String userImage =
      'https://i.pravatar.cc/150'; // replace with the URL of the user's profile picture
  // 'https://www.facebook.com/photo/?fbid=1566615570342946&set=a.106565663014618';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 117, 203, 189),
        leadingWidth: 25,
        elevation: 0,
        actions: [
          Icon(Icons.person),
        ],
        title: Text(
          'PROFILE',
          style: TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 247, 245, 245),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 80.0,
                  backgroundImage: NetworkImage(userImage),
                ),
                SizedBox(height: 16.0),
                Text('Name: $userName', style: TextStyle(fontSize: 20)),
                SizedBox(height: 16.0),
                Text('Email: $userEmail', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'Settings.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';

// class myprofile extends StatefulWidget {
//   myprofile({super.key});

//   @override
//   State<myprofile> createState() => _myprofileState();
// }

// class _myprofileState extends State<myprofile> {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   final ImagePicker _picker = ImagePicker();
//   String userEmail = FirebaseAuth.instance.currentUser!.email!;
//   String userName = 'John Doe'; // replace with the user's actual name
//   String userImage =
//       'https://i.pravatar.cc/150'; // replace with the URL of the user's profile picture
//   File? _image;

//   Future<void> _getImage() async {
//     final pickedFile = await _picker.getImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   Future<void> _uploadImage() async {
//     if (_image == null) return;

//     FirebaseStorage storage = FirebaseStorage.instance;
//     Reference ref =
//         storage.ref().child('user_images/${_auth.currentUser!.uid}');
//     UploadTask uploadTask = ref.putFile(_image!);
//     await uploadTask.whenComplete(() async {
//       String url = await ref.getDownloadURL();
//       setState(() {
//         userImage = url;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple[300],
//         leadingWidth: 25,
//         elevation: 0,
//         actions: [
//           Icon(Icons.person),
//         ],
//         title: Text(
//           'P R O F I L E',
//           style: TextStyle(
//               fontSize: 24,
//               color: Color.fromARGB(255, 247, 245, 245),
//               fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: ListView(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: _getImage,
//                   child: CircleAvatar(
//                     radius: 80.0,
//                     backgroundImage: _image != null
//                         ? FileImage(_image!)
//                         : NetworkImage(userImage),
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text('Name: $userName', style: TextStyle(fontSize: 20)),
//                 SizedBox(height: 16.0),
//                 Text('Email: $userEmail', style: TextStyle(fontSize: 20)),
//                 SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: _uploadImage,
//                   child: Text('Upload Image'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
