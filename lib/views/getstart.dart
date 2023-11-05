import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Homepage.dart';

class getstartt extends StatefulWidget {
  const getstartt({super.key});

  @override
  State<getstartt> createState() => _getstarttState();
}

class _getstarttState extends State<getstartt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
              child: Icon(
            Icons.flutter_dash,
            size: 300,
          )),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                SharedPreferences preference =
                    await SharedPreferences.getInstance();
                preference
                    .setBool('start', true)
                    .then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => homepage(),
                        )));
              },
              child: Text("Get Started"),
            ),
          )
        ],
      ),
    );
  }
}
