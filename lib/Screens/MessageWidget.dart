import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:path_provider/path_provider.dart';
import 'Message.dart';
// import 'dart:js';
// import 'dart:html';
import 'package:flutter_tts/flutter_tts.dart';

final FlutterTts flutterTts = FlutterTts();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  bool voiceInput = false;
  double _confidence = 1.0;
  int temp = 1;

  // Welcome speech
  Future<void> _speak(String text) async {
    if (text.isNotEmpty && temp == 1) {
      await flutterTts.setLanguage("en-UK");

      await flutterTts.setSpeechRate(0.50);
      await flutterTts.awaitSpeakCompletion(true);
      await flutterTts.speak(text);
    }
  }

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    _speak(
        'Hello Maria! Welcome to Lidl. I\'m your virtual shopping asssistant. What can I help you with today?');
    _speech = stt.SpeechToText();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text(
        //   'Tia - The Assistant',
        //   style: TextStyle(color: Color.fromARGB(255, 37, 37, 132)),
        // ),

        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Color.fromARGB(255, 6, 87, 141),
        endRadius: 75.0,
        duration: const Duration(milliseconds: 8000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: _listen,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
          backgroundColor: Color.fromARGB(255, 104, 195, 255),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            color: Color.fromARGB(255, 232, 250, 255),
          ),
          Expanded(child: MessagesScreen(messages: messages)),
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            color: Color.fromARGB(255, 104, 195, 255),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: _controller,
                  style: TextStyle(
                    color: Color.fromARGB(255, 14, 14, 14),
                  ),
                  decoration: InputDecoration(
                    labelText: _text,
                  ),
                )),
                IconButton(
                    onPressed: () {
                      if (voiceInput) {
                        sendMessage(_text);
                      } else {
                        sendMessage(_controller.text);
                      }
                      _controller.clear();
                    },
                    icon: Icon(Icons.send))
              ],
            ),
          )
        ],
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      voiceInput = true;
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
      sendMessage(_text);
    }
  }
}
