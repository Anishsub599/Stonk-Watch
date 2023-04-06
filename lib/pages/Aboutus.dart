import 'package:flutter/material.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              'About Stonk Watch',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Stonk Watch is a personal finance management app that helps you keep track of your investments in the stock market. With features similar to an investment management app, our app is designed to be user-friendly and easy to use.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 24),
            Text(
              'We use the Alpha Vintage API key to get live data for various stocks. This allows us to provide up-to-date information to our users at all times.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 24),
            Text(
              'Our app is still under development, and we are constantly adding new features and improving the user experience. We appreciate any feedback you have, so please feel free to contact us at [email protected]',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Contact Us',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
