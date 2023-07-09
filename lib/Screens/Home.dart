import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herhackathon/Screens/Profile.dart';
import 'package:herhackathon/Screens/RequestScreen.dart';
import 'package:herhackathon/Screens/Scan.dart';
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
      drawer: NavigationDrawer(
        backgroundColor: Colors.white,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              radius: (52),
              backgroundColor: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset("images/avatar.png"),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Color(0xff2E68FF),
            ),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.request_page,
              color: Color(0xff2E68FF),
            ),
            title: Text(
              'Requests',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RequestScreen(),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.group,
              color: Color(0xff2E68FF),
            ),
            title: Text(
              'Community',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScanScreen(),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: Color(0xff2E68FF),
            ),
            title: Text(
              'Notifications',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScanScreen(),
                ),
              ),
            },
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Color(0xff2E68FF),
            ),
            title: Text(
              'Settings',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(
              Icons.description,
              color: Color(0xff2E68FF),
            ),
            title: Text(
              'Privacy and Terms',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            onTap: () => null,
          ),
        ],
      ),
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xff2E68FF),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Color(0xff2E68FF),
        endRadius: 75.0,
        duration: const Duration(milliseconds: 8000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: _listen,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
          backgroundColor: Color(0xFFEDF2FF),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            color: Color.fromARGB(255, 232, 250, 255),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Card(
                      color: Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 8, 15, 5),
                        child: Text(
                          "How to use Tia, an intelligent assistant to help you with orders and community requests?",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Frequent tasks',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF2D68FF),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Card(
                          color: Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "Want to help others ",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: const Card(
                          color: Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "Community",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Card(
                            color: Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                "Scan items",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScanScreen()),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: const Card(
                          color: Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "Get help",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: MessagesScreen(messages: messages)),
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            color: Color(0xff2E68FF),
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
                        _controller.clear();
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
      _controller.clear();
    }
  }
}
