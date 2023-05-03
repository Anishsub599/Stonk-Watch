import 'Settings.dart';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_volume_controller/flutter_volume_controller.dart';

class SoundSettingsPage extends StatefulWidget {
  @override
  _SoundSettingsPageState createState() => _SoundSettingsPageState();
}

class _SoundSettingsPageState extends State<SoundSettingsPage> {
  double _volume = 0.5;
  StreamSubscription<double>? _volumeSubscription;

  // @override
  // void initState() {
  //   super.initState();
  //   _initVolume();
  // }

  // @override
  // void dispose() {
  //   _volumeSubscription?.cancel();
  //   super.dispose();
  // }

  // Future<void> _initVolume() async {
  //   double volume = await FlutterVolume.Volume();
  //   setState(() {
  //     _volume = volume;
  //   });
  //   _volumeSubscription = FlutterVolume.se.listen((volume) {
  //     setState(() {
  //       _volume = volume;
  //     });
  //   });
  // }

  // Future<void> _setVolume(double volume) async {
  //   await FlutterVolume.setVolume(volume);
  //   setState(() {
  //     _volume = volume;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sound Settings'),
      ),
      body: Column(
        children: [
          SizedBox(height: 32),
          Text(
            'Adjust the volume:',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          // Slider(
          //   value: _volume,
          //   // onChanged: _setVolume,
          //   min: 0,
          //   max: 1,
          //   divisions: 10,
          //   label: '${(_volume * 100).round()}%',
          // ),
        ],
      ),
    );
  }
}
