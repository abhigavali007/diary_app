import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'DatabaseManager.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

TextEditingController t1 = TextEditingController();
TextEditingController t2 = TextEditingController();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Home",
            textAlign: TextAlign.center,
          ),
        ),
        body: Column(
          children: [
            Text("Date"),
            TextFormField(
              controller: t1,
              decoration: InputDecoration(
                hintText: "dd/mm/yyyy",
                contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            Text("Content"),
            Flexible(
              child: TextFormField(
                controller: t2,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  //hintText: " ",

                  contentPadding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            RaisedButton(
              child: Text("Upload"),
              color: Colors.blue,
              onPressed: () {
                setState(() {
                  String date = t1.text.toString();
                  String info = t2.text.toString();
                  DatabaseManager().uplaodData(date, info);
                });
              },
            )
          ],
        ),
      ),
    ));
  }
}
