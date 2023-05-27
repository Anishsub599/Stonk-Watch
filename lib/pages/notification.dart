import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  Map<String, bool> notificationOptions = {
    'Push Notifications': true,
    'Email Notifications': false,
    'In-App Notifications': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings'),
      ),
      body: ListView.builder(
        itemCount: notificationOptions.length,
        itemBuilder: (context, index) {
          final optionTitle = notificationOptions.keys.elementAt(index);
          final isEnabled = notificationOptions[optionTitle];

          return NotificationOption(
            title: optionTitle,
            isEnabled: isEnabled!,
            onChanged: (value) {
              setState(() {
                notificationOptions[optionTitle] = value;
              });
            },
          );
        },
      ),
    );
  }
}

class NotificationOption extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final ValueChanged<bool> onChanged;

  NotificationOption({
    required this.title,
    required this.isEnabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Switch(
        value: isEnabled,
        onChanged: onChanged,
      ),
    );
  }
}
