import 'package:flutter/material.dart';
import 'Settings.dart';

class PrivacySecurityPage extends StatefulWidget {
  @override
  _PrivacySecurityPageState createState() => _PrivacySecurityPageState();
}

class _PrivacySecurityPageState extends State<PrivacySecurityPage> {
  bool _enableFingerprint = false;
  bool _enableTwoFactorAuth = false;
  bool _enableLocationTracking = true;

  void _toggleFingerprint(bool value) {
    setState(() {
      _enableFingerprint = value;
    });
  }

  void _toggleTwoFactorAuth(bool value) {
    setState(() {
      _enableTwoFactorAuth = value;
    });
  }

  void _toggleLocationTracking(bool value) {
    setState(() {
      _enableLocationTracking = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy & Security'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Use fingerprint to unlock'),
            subtitle: Text('Enable fingerprint authentication'),
            trailing: Switch(
              value: _enableFingerprint,
              onChanged: _toggleFingerprint,
            ),
          ),
          ListTile(
            title: Text('Enable two-factor authentication'),
            subtitle: Text('Add an extra layer of security'),
            trailing: Switch(
              value: _enableTwoFactorAuth,
              onChanged: _toggleTwoFactorAuth,
            ),
          ),
          ListTile(
            title: Text('Location tracking'),
            subtitle: Text('Allow location access'),
            trailing: Switch(
              value: _enableLocationTracking,
              onChanged: _toggleLocationTracking,
            ),
          ),
        ],
      ),
    );
  }
}
