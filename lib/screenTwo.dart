import 'package:flutter/material.dart';

enum Aliens { mother, father, cat, dog }

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() {
    return _SecondScreenState();
  }
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController textFieldController = TextEditingController();
  Aliens selectedAliens = Aliens.mother;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Write the name of your..........'),
          for (Aliens aliens in Aliens.values)
            Row(
              children: [
                Radio(
                    value: aliens,
                    groupValue: selectedAliens,
                    onChanged: (value) {
                      setState(() {
                        selectedAliens = value as Aliens;
                      });
                    }),
                Text(aliens.toString().split('.').last),
              ],
            ),
          //Text('Selected: $selectedAliens'),
          Row(
            children: <Widget>[
              Text("${selectedAliens.toString().split('.').last}'s name"),
              Expanded(
                child: TextField(
                  controller: textFieldController,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
              child: const Text(
                'Send text back',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () {
                _sendDataBack(context);
              })
        ],
      ),
    );
  }

  void _sendDataBack(BuildContext context) {
    String textToSendBack = textFieldController.text;
    String selectedAlien = selectedAliens.toString().split('.').last;
    Navigator.pop(context, "$selectedAlien's name: $textToSendBack");
  }
}
