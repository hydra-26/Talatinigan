import 'package:flutter/material.dart';

class GuessGrid extends StatelessWidget {
  final List<String> guessedWords;
  final String targetWord;
  final bool isGameOver;
  final bool isSubmitted;
  final String currentGuess;

  const GuessGrid({
    required this.guessedWords,
    required this.targetWord,
    required this.isGameOver,
    required this.isSubmitted,
    required this.currentGuess,
  });

  @override
  Widget build(BuildContext context) {
    int wordLength = targetWord.length; // Number of columns
    double boxSize = 50.0; // Fixed box size

    return Center(
      child: Container(
        width: wordLength * boxSize + (wordLength - 1) * 8, // Total grid width
        height: 5 * boxSize + (5 - 1) * 8, // Total grid height
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(), // Disable scrolling
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: wordLength, // Number of columns
            crossAxisSpacing: 8, // Space between columns
            mainAxisSpacing: 8, // Space between rows
          ),
          itemCount: 5 * wordLength, // Total cells (rows * columns)
          itemBuilder: (context, index) {
            int row = index ~/ wordLength; // Calculate row
            int col = index % wordLength; // Calculate column
            String letter = '';

            // Determine the letter to display
            if (row < guessedWords.length) {
              if (col < guessedWords[row].length) {
                letter = guessedWords[row][col];
              }
            } else if (row == guessedWords.length) {
              if (col < currentGuess.length) {
                letter = currentGuess[col];
              }
            }

            Color boxColor = Colors.white;
            Color borderColor = Colors.brown; // Default border color

            // Determine box color for guessed words
            if (isSubmitted && row < guessedWords.length) {
              if (letter.isNotEmpty) {
                boxColor = _getBoxColor(letter, col);
                borderColor = boxColor; // Border color matches the box color
              }
            }

            // Display target word after game over
            if (isGameOver && row == guessedWords.length) {
              letter = targetWord[col];
              boxColor = _getBoxColor(letter, col);
              borderColor = boxColor; // Border color matches the box color
            }

            Color textColor = boxColor == Colors.green.shade800 ||
                    boxColor == Colors.yellow.shade700 ||
                    boxColor == Colors.grey
                ? Colors.white
                : Colors.brown;

            return Container(
              width: boxSize,
              height: boxSize,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                    color: borderColor, width: 2.0), // Dynamic border color
                borderRadius: BorderRadius.circular(5),
                color: boxColor,
              ),
              child: Text(
                letter,
                style: TextStyle(
                  color: letter.isEmpty
                      ? Colors.white
                      : textColor, // Change text color to white if the box color is green, yellow, or gray
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Determine box color based on guess accuracy
  Color _getBoxColor(String letter, int index) {
    if (targetWord[index] == letter) {
      return Colors.green.shade800; // Correct letter and position
    } else if (targetWord.contains(letter)) {
      return Colors.yellow.shade700; // Correct letter, wrong position
    } else {
      return Colors.grey; // Incorrect letter
    }
  }
}
