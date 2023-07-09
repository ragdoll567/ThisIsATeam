import 'package:flutter/material.dart';

import 'MoreInfo.dart';

class ResultScreen extends StatelessWidget {
  final String text;

  ResultScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: const Text('Result'), backgroundColor: Color(0xff2E68FF)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(30.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        text,
                        style:
                            TextStyle(color: Color(0xff2E68FF), fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MoreInfo()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "More Info",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
