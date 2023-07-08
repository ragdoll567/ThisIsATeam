import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:path_provider/path_provider.dart';

class MessagesScreen extends StatefulWidget {
  final List messages;
  const MessagesScreen({Key? key, required this.messages}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                    topRight: Radius.circular(70))),
            height: 300,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: widget.messages[index]['isUserMessage']
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 14),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                    20,
                                  ),
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(
                                      widget.messages[index]['isUserMessage']
                                          ? 0
                                          : 20),
                                  topLeft: Radius.circular(
                                      widget.messages[index]['isUserMessage']
                                          ? 20
                                          : 0),
                                ),
                                color: widget.messages[index]['isUserMessage']
                                    ? Color.fromARGB(255, 104, 195, 255)
                                    : Color.fromARGB(255, 42, 42, 154)
                                        .withOpacity(0.8)),
                            constraints: BoxConstraints(maxWidth: w * 2 / 3),
                            child: Text(widget
                                .messages[index]['message'].text.text[0])),
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, i) =>
                    Padding(padding: EdgeInsets.only(top: 10)),
                itemCount: widget.messages.length),
          ),
        ],
      ),
    );
  }
}
