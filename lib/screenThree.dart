import 'package:flutter/material.dart';

// Class definition for the ColorPicker widget
class ColorPicker extends StatefulWidget {
  // Override the createState method to return the state object for this widget
  @override
  _ColorPickerState createState() {
    return _ColorPickerState();
  }
}

// State object for the ColorPicker widget
class _ColorPickerState extends State<ColorPicker> {
  // Initial values for the red, green, and blue color channels
  String red = '00';
  String green = '00';
  String blue = '00';

  // Override the build method to build the UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // The app bar with a title "Third Screen"
        appBar: AppBar(title: const Text('Third Screen')),
        // The body of the scaffold
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // A container to display the selected color
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                // The background color of the container is set based on the RGB color channels
                color: Color(int.parse("0xff$red$green$blue")),
              ),
            ),
            // A sized box with a fixed height to add some space between elements
            const SizedBox(height: 20),
            // A sized box containing the color selection dropdown menus
            SizedBox(
              width: 200,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // The dropdown menu for the red color channel
                  _builder("Red", 'red'),
                  // A sized box with a fixed width to add some space between elements
                  const SizedBox(width: 20),
                  // The dropdown menu for the green color channel
                  _builder("Green", 'green'),
                  // A sized box with a fixed width to add some space between elements
                  const SizedBox(width: 20),
                  // The dropdown menu for the blue color channel
                  _builder("Blue", 'blue'),
                ],
              ),
            ),
            // An elevated button to send the selected color back to the previous screen
            ElevatedButton(
                child: const Text(
                  'Send color back',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  // Call the _sendColorBack method when the button is pressed
                  _sendColorBack(context);
                })
          ],
        ));
  }

  Widget _builder(String label, String colorChannel) {
    // Return a Column widget which contains text and a dropdown button for choosing color value
    return Column(
      children: [
        // Display the label for the dropdown button
        Text(label),
        // Add a space between label and dropdown button
        const SizedBox(height: 5),
        // Create a SizedBox to define the width and height of the dropdown button
        SizedBox(
          width: 50,
          height: 28,
          // Add a DropdownButton widget to display the list of color values
          child: DropdownButton<String>(
            // Determine the current value of the dropdown button based on the color channel
            value: colorChannel == 'red'
                ? red
                : colorChannel == 'green'
                    ? green
                    : blue,
            // Specify the method to be called when the value of the dropdown button is changed
            onChanged: (value) {
              // Call the setState method to trigger a rebuild of the widget tree and update the UI
              setState(() {
                // Update the value of the color channel based on the selected value from the dropdown button
                if (colorChannel == 'red') {
                  red = value as String;
                } else if (colorChannel == 'green') {
                  green = value as String;
                } else if (colorChannel == 'blue') {
                  blue = value as String;
                }
              });
            },
            // Add the items in the dropdown menu
            items: [
              '00',
              '10',
              '20',
              '30',
              '40',
              '50',
              '60',
              '70',
              '80',
              '90',
              'A0',
              'B0',
              'C0',
              'D0',
              'E0',
              'F0',
              'FF'
            ].map((value) {
              // Return a DropdownMenuItem widget for each value in the list
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  void _sendColorBack(BuildContext context) {
    // Pop the current context and send the color back to the previous screen
    Navigator.pop(context, '#$red$green$blue');
  }
}
