import 'package:flutter/material.dart';


class theme extends StatefulWidget {
  const theme({super.key});

  @override
  State<theme> createState() => _themeState();
}
bool _iconBool = false; 
IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;
ThemeData _LightTheme =ThemeData(
primarySwatch: Colors.amber,
brightness: Brightness.light,
  
);
ThemeData _darkTheme =ThemeData(
primarySwatch: Colors.red,
brightness: Brightness.dark,
  
);



class _themeState extends State<theme> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: _iconBool ? _darkTheme: _LightTheme,
      home: Scaffold(
        appBar: AppBar(

          title: Text('Dark and Light theme'),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                _iconBool = !_iconBool;
              });


          },
          icon: Icon(_iconBool ? _iconDark:_iconLight),
          ),
        ],

        ),
        body: Center(child: 

        Text('work on progress'),
        
        ),


      
      
      
      
      ),


    );
  }
}