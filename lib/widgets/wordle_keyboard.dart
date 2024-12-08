import 'package:flutter/material.dart';

class WordleKeyboard extends StatelessWidget {
  final Function(String) onKeyPress;
  final Map<String, Color> keyColors;
  final Function() onSubmit; // Added submit callback for the submit button

  WordleKeyboard({
    required this.onKeyPress,
    required this.keyColors,
    required this.onSubmit, // Accepts the submit callback
  });

  @override
  Widget build(BuildContext context) {
    List<String> row1 = ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'];
    List<String> row2 = ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'];
    List<String> row3 = ['Z', 'X', 'C', 'V', 'B', 'N', 'M'];
    List<String> row4 = ['BACKSPACE', 'ENTER'];

    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          // First row of the keyboard
          _buildKeyRow(row1),
          // Second row of the keyboard
          _buildKeyRow(row2),
          // Third row of the keyboard (includes Backspace)
          _buildKeyRow(row3 + ['BACKSPACE']),
          // Submit button row (ENTER)
          _buildSubmitButtonRow(row4),
        ],
      ),
    );
  }

  // Builds a row of keys using GridView.builder
  Widget _buildKeyRow(List<String> keys) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: keys.map((key) => _buildKey(key)).toList(),
    );
  }

  // Builds a key button
  Widget _buildKey(String key) {
    Color keyColor = keyColors[key] ?? Colors.white; // Default color is white
    Color textColor = (keyColor == Colors.green.shade800 ||
            keyColor == Colors.yellow.shade700 ||
            keyColor == Colors.grey)
        ? Colors.white // White text for green keys
        : Colors.black; // Default black text
    return Padding(
      padding: EdgeInsets.all(2),
      child: SizedBox(
        height: 50,
        width: 34,
        child: ElevatedButton(
          onPressed: () => onKeyPress(key),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(30, 40), // Ensure keys have equal size
            padding: EdgeInsets.symmetric(horizontal: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: Colors.brown, // Border color
                width: 2, // Border width
              ),
            ),
            backgroundColor: keyColor,
          ),
          child: key == 'BACKSPACE'
              ? Icon(
                  Icons.backspace,
                  size: 20,
                  color: Colors.black,
                )
              : Text(
                  key,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }

  // Builds the Submit button (Enter) with a larger size
  Widget _buildSubmitButtonRow(List<String> keys) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: onSubmit, // Calls the submit function when clicked
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 0, 106, 4),
              minimumSize: Size(100, 50), // Larger size for the submit button
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "SUBMIT",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
