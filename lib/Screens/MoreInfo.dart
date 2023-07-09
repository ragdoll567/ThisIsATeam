import 'package:flutter/material.dart';

import 'package:flutter_tts/flutter_tts.dart';

class MoreInfo extends StatefulWidget {
  const MoreInfo({super.key});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

final FlutterTts flutterTts = FlutterTts();

class _MoreInfoState extends State<MoreInfo> {
  int temp = 1;
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
    super.initState();

    _speak(
        'It\'s Pick Up original Chocolate by Bahlsen. Some nutritional products about this product are as follows: Nutrition Score : E, Ultra Processed food, High amount of fat, Hight amount of Sugar, High amount of saturated fat. it\'s non-vegan and contains palm oil');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information'),
        backgroundColor: Color(0xff2E68FF),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 60, 40, 40),
              child: Image(
                image: AssetImage("images/pickup.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset("images/nutriinfo.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset("images/environment.png"),
            ),
          ],
        ),
      ),
    );
  }
}
