import 'package:change_page/screenThree.dart';
import 'package:change_page/screenTwo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    home:
        FirstScreen(), // Start the application by creating an instance of FirstScreen widget.
  ));
}

class FirstScreen extends StatefulWidget {
  final Aliens?
      selectedAlien; // A nullable property 'selectedAlien' of type 'Aliens'

  FirstScreen({this.selectedAlien}); // Constructor for FirstScreen widget

  @override
  _FirstScreenState createState() {
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {
  String textFromSecond =
      'Here comes the name'; // A string property to store text from SecondScreen
  Color?
      backgroundColor; // A nullable property to store the selected color from ThirdScreen

  final Aliens selectedAnimal;

  _FirstScreenState(
      {this.selectedAnimal = Aliens
          .mother}); // Constructor for _FirstScreenState class, with a default value for the property 'selectedAnimal'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(32.0),
              child: Text(
                'Get ones name and color',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ElevatedButton(
              child: const Text(
                'Go To Second Screen',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () {
                _awaitReturnValueFromSecondScreen(
                    context); // Call the function to navigate to SecondScreen and retrieve data from it
              },
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                textFromSecond,
                style: TextStyle(
                  fontSize: 24,
                  backgroundColor: backgroundColor,
                ),
              ),
            ),
            ElevatedButton(
              child: const Text(
                'Go To Third Screen',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () {
                _awaitReturnValueFromThirdScreen(
                    context); // Call the function to navigate to ThirdScreen and retrieve data from it
              },
            )
          ],
        ),
      ),
    );
  }

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    final result = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SecondScreen(),
    ));
    setState(() {
      textFromSecond =
          result; // Update the 'textFromSecond' property with the retrieved value
    });
  }

  void _awaitReturnValueFromThirdScreen(BuildContext context) async {
    // returns a Future with the value returned from `pop` method
    // from the third screen.
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ColorPicker(), // Destination screen
        ));
    // Once third screen returns a value, setState method is called
    // to update the `backgroundColor` variable with the color returned.
    setState(() {
      // The color value is returned as a string in the format of "#RRGGBB".
      // The following line parses the string into a color value.
      int colorValue = int.parse(result.substring(1), radix: 16) + 0xFF000000;
      backgroundColor = Color.fromARGB(
        0xff,
        (colorValue >> 16) & 0xff,
        (colorValue >> 8) & 0xff,
        colorValue & 0xff,
      );
    });
  }
}
