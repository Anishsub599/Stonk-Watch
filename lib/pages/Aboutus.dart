import 'package:flutter/material.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'About Stonk Watch',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Stonk Watch is a personal finance management app that helps you keep track of your investments in the stock market. With features similar to a investment management app, our app is designed to be user-friendly and easy to use.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'We use the Alpha Vintage API key to get live data for various stocks. This allows us to provide up-to-date information to our users at all times.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Our app is still under development, and we are constantly adding new features and improving the user experience. We appreciate any feedback you have, so please feel free to contact us at [email protected]',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
