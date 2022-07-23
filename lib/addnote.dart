import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class addnote extends StatefulWidget {
  @override
  _addnoteState createState() => _addnoteState();
}

class _addnoteState extends State<addnote> {
  TextEditingController second = TextEditingController();

  TextEditingController third = TextEditingController();

  final fb = FirebaseDatabase.instance;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var rng = Random();
    var k = rng.nextInt(10000);

    final ref = fb.ref().child('todos/$k');
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todos"),
        backgroundColor: Colors.brown[400],
      ),
      body: Container(
        child: Column(
          key: formKey,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextFormField(
                controller: second,
                decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextFormField(
                controller: third,
                decoration: InputDecoration(
                    hintText: 'Sub title',
                    hintStyle: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: Colors.brown,
              onPressed: () {
                ref.set({
                  "title": second.text,
                  "subtitle": third.text,
                }).asStream();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              },
              child: Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
