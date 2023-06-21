import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const String KEYNAME = "name";
  var nameValue = "No Value";
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {


    @override
    void initState(){
      super.initState();
      getValue();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
            ),
            ElevatedButton(onPressed: () async{
              var name = nameController.text.toString();

              var prefs = await SharedPreferences.getInstance();
              
              prefs.setString(KEYNAME, nameController.text.toString());

            }, child: Text('Save'))
          ],
        ),
      )
    );
  }

  void getValue() async{
    var prefs = await SharedPreferences.getInstance();

   var getName = prefs .getString(KEYNAME);

   nameValue = getName!=null ?getName :"No Value In It";

   setState(() {

   });
  }
}
