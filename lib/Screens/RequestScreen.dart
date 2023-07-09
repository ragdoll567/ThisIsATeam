import 'package:flutter/material.dart';
import 'package:herhackathon/Screens/Home.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requests'),
        backgroundColor: Color(0xff2E68FF),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Requests created by you",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 4,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              child: Text("S"),
                            ),
                            Text(
                              "Your Request",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                          child: Text(
                            "Reward Points",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Text(
                            "+30",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                          child: Text(
                            "List of goods inside this order: Apples, weight: 500g.",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 51, 174, 7)),
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.all(15),
                                ),
                              ),
                              onPressed: null,
                              child: Text(
                                "Status - In progress",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Divider(
                  color: Color(0xff2E68FF),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Requests by Community members",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 4,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              child: Text("S"),
                            ),
                            Text(
                              "Request from Sophie",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                          child: Text(
                            "Reward Points",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Text(
                            "+50",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                          child: Text(
                            "List of goods inside this order: Eggs, weight: 500g.",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff2E68FF)),
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.all(15),
                                ),
                              ),
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Thank you!'),
                                  content: Container(
                                    height: 150,
                                    child: Column(
                                      children: [
                                        const Text(
                                            'You\'re a great neighbor! Thanks for helping Sophie'),
                                        Image.asset(
                                          "images/high-five.png",
                                          height: 100,
                                          width: 100,
                                        )
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Home(),
                                        ),
                                      ),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              ),
                              child: Text(
                                "Accept",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 203, 203, 203)),
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.all(15),
                                ),
                              ),
                              onPressed: null,
                              child: Text(
                                "Refuse",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 4,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              child: Text("S"),
                            ),
                            Text(
                              "Request from Maria",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                          child: Text(
                            "Reward Points",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Text(
                            "+60",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                          child: Text(
                            "List of goods inside this order: Paracetamol",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff2E68FF)),
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.all(15),
                                ),
                              ),
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Thank you!'),
                                  content: const Text(
                                      'You\'re a great neighbor! Thanks for helping Sophie'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Home(),
                                        ),
                                      ),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              ),
                              child: Text(
                                "Accept",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 203, 203, 203)),
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.all(15),
                                ),
                              ),
                              onPressed: null,
                              child: Text(
                                "Refuse",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
