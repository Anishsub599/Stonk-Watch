

import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'package:endproject/main.dart';
import 'package:endproject/pages/homepage.dart';
import 'package:cupertino_icons/cupertino_icons.dart';


class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return MaterialApp(
      title: "login page",
      home: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // Add TextFormFields and ElevatedButton here.
      //         TextFormField(
        
      //   validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Please enter some text';
      //   }
      //   return null;
      //   },
      // ),
      // ElevatedButton(
      //   onPressed: () {
      //   // Validate returns true if the form is valid, or false otherwise.
      //   if (_formKey.currentState!.validate()) {
      
      //     // If the form is valid, display a snackbar. In the real world,
      //     // you'd often call a server or save the information in a database.
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(content: Text('Processing Data')),
            
      //     );
      //   }
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homepage(),));
//         },
//         child: const Text('Submit'),
        
//       ),
SizedBox(
  height: 44,
),
            TextField(

                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "user email",
                  prefixIcon: Icon(Icons.mail,color: Colors.black,),

                
                
                ),
            ),
            SizedBox(height: 44,),
                TextField(

                obscureText: true,
                decoration: InputDecoration(
                  
                hintText: "user password",
                prefixIcon: Icon(Icons.lock,color: Colors.black,),
                
                ),




            ),
            
            Text("dont remember your password",
            
            selectionColor: Colors.blue,
            ),
            SizedBox(
              height: 8,
            ),

            Container(
              width: double.infinity,
               child: RawMaterialButton(
              fillColor: Color.fromARGB(255, 69, 107, 232), 
              elevation: 0.0,

              padding: EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder (
              borderRadius: BorderRadius.circular (12.0)),
              onPressed: (){},
              child: Text("login",selectionColor: Colors.black26,),

               
               ),
            ),
            ],
            
          ),
        ),
      ),
    );
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homepage(),));
    
  }
}

            