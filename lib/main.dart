import 'package:change_page/screenThree.dart';
import 'package:change_page/screenTwo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    home: FirstScreen(),
  ));
}

class FirstScreen extends StatefulWidget {
  final Aliens? selectedAnimal;

  FirstScreen({this.selectedAnimal});

  @override
  _FirstScreenState createState() {
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {
  String textFromSecond = 'Here comes the name';
  Color? backgroundColor;

  final Aliens selectedAnimal;

  _FirstScreenState({this.selectedAnimal = Aliens.mother});

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
                _awaitReturnValueFromSecondScreen(context);
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
                _awaitReturnValueFromThirdScreen(context);
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
      textFromSecond = result;
    });
  }

  void _awaitReturnValueFromThirdScreen(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ColorPicker(),
        ));
    setState(() {
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
