import 'package:endproject/pages/changepass.dart';
import 'package:endproject/pages/language.dart';
import 'package:endproject/pages/social.dart';
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
                text: 'Language setting',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LanguageSelectionPage(),
                    ),
                  );
                },
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
