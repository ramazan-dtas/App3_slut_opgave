// Importing the material library
import 'package:flutter/material.dart';

// Enum to hold the values of different aliens
enum Aliens { mother, father, cat, dog }

// SecondScreen widget that extends StatefulWidget
class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() {
    // Return an instance of the _SecondScreenState
    return _SecondScreenState();
  }
}

// State class for SecondScreen widget
class _SecondScreenState extends State<SecondScreen> {
  // TextEditingController to control the text field
  TextEditingController textFieldController = TextEditingController();
  // Holds the selected aliens value
  Aliens selectedAliens = Aliens.mother;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        leading: BackButton(
          onPressed: () {
            _sendDataBack(context);
          },
          color: Colors.black,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text to ask for name
          const Text('Write the name of your..........'),
          // Loop through the values in the Aliens enum
          for (Aliens aliens in Aliens.values)
            Row(
              children: [
                // Radio button to select the aliens
                Radio(
                    value: aliens,
                    groupValue: selectedAliens,
                    onChanged: (value) {
                      // Set the state when the radio button is selected
                      setState(() {
                        selectedAliens = value as Aliens;
                      });
                    }),
                // Text to display the name of the aliens
                Text(aliens.toString().split('.').last),
              ],
            ),
          // Row to display the text field and label
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
          // Button to send data back
          ElevatedButton(
              child: const Text(
                'Send text back',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () {
                // Function to send data back to the previous screen
                _sendDataBack(context);
              })
        ],
      ),
    );
  }

  // Function to send data back to the previous screen
  void _sendDataBack(BuildContext context) {
    // Text to send back
    String textToSendBack = textFieldController.text;
    // Selected alien
    String selectedAlien = selectedAliens.toString().split('.').last;
    // Pop the current screen and send data back
    Navigator.pop(context, "$selectedAlien's name: $textToSendBack");
  }
}
