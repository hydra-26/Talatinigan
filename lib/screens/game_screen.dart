// // import 'package:flutter/material.dart';
// // import '../widgets/wordle_keyboard.dart';
// // import '../widgets/guess_grid.dart';
// // import '../model/wordle_game.dart';

// // class GameScreen extends StatefulWidget {
// //   final String selectedDifficulty;

// //   GameScreen({required this.selectedDifficulty});

// //   @override
// //   _GameScreenState createState() => _GameScreenState();
// // }

// // class _GameScreenState extends State<GameScreen> {
// //   late WordleGame game;
// //   String currentGuess = "";
// //   Map<String, Color> keyColors = {};
// //   int totalScore = 0; // Track cumulative score
// //   int highScore = 0; // Store high score

// //   @override
// //   void initState() {
// //     super.initState();
// //     game = WordleGame(widget.selectedDifficulty, 5);
// //   }

// //   void _onKeyPress(String letter) {
// //     setState(() {
// //       if (letter == "BACKSPACE") {
// //         if (currentGuess.isNotEmpty) {
// //           currentGuess = currentGuess.substring(0, currentGuess.length - 1);
// //         }
// //       } else if (letter == "ENTER") {
// //         if (currentGuess.length == game.targetWord.length) {
// //           game.guessWord(currentGuess);
// //           _updateKeyColors();
// //           if (game.hasWon()) {
// //             _updateScore();
// //             _showResultDialog(true);
// //           } else if (game.isGameOver()) {
// //             highScore = totalScore; // Set high score
// //             _showResultDialog(false);
// //           }
// //           currentGuess = "";
// //         }
// //       } else if (currentGuess.length < game.targetWord.length) {
// //         currentGuess += letter;
// //       }
// //     });
// //   }

// //   void _updateScore() {
// //     setState(() {
// //       // Example scoring logic: Points based on remaining attempts
// //       int roundScore = (game.maxAttempts - game.guessedWords.length) * 100;
// //       totalScore += roundScore;
// //     });
// //   }

// //   void _showResultDialog(bool won) {
// //     showDialog(
// //       context: context,
// //       barrierDismissible: false,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: Text(won ? 'Correct!' : 'Game Over'),
// //           content: Text(
// //             won
// //                 ? 'You guessed the word correctly!'
// //                 : 'You ran out of attempts. High Score: $highScore',
// //           ),
// //           actions: [
// //             ElevatedButton(
// //               onPressed: () {
// //                 Navigator.pop(context);
// //                 if (won) {
// //                   _startNextRound();
// //                 } else {
// //                   _resetGame();
// //                 }
// //               },
// //               child: Text(won ? 'Continue' : 'Play Again'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   void _startNextRound() {
// //     setState(() {
// //       game = WordleGame(widget.selectedDifficulty, 5);
// //       currentGuess = "";
// //       keyColors.clear(); // Reset keyboard colors
// //     });
// //   }

// //   void _resetGame() {
// //     setState(() {
// //       game = WordleGame(widget.selectedDifficulty, 5);
// //       currentGuess = "";
// //       totalScore = 0; // Reset score
// //       keyColors.clear(); // Reset keyboard colors
// //     });
// //   }

// //   void _updateKeyColors() {
// //     for (int i = 0; i < game.targetWord.length; i++) {
// //       String letter = currentGuess[i];
// //       Color newColor = _getKeyColor(letter, i);
// //       keyColors[letter] = newColor;
// //     }
// //     setState(
// //         () {}); // Force a rebuild to update key colors immediately after submitting
// //   }

// //   Color _getKeyColor(String letter, int index) {
// //     if (game.targetWord[index] == letter) {
// //       return Colors.green.shade800;
// //     } else if (game.targetWord.contains(letter)) {
// //       return Colors.yellow.shade700;
// //     } else {
// //       return Colors.grey;
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('${game.antas}'),
// //         centerTitle: true,
// //       ),
// //       body: Container(
// //         color: game.colors,
// //         child: Column(
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.symmetric(vertical: 8.0),
// //               child: Text(
// //                 "$totalScore",
// //                 style: TextStyle(
// //                     color: Colors.brown,
// //                     fontSize: 40,
// //                     fontWeight: FontWeight.w800,
// //                     fontFamily: "Poppins"),
// //               ),
// //             ),
// //             // Guess Grid
// //             Expanded(
// //               child: Padding(
// //                 padding: const EdgeInsets.all(20.0),
// //                 child: GuessGrid(
// //                   guessedWords: game.guessedWords,
// //                   targetWord: game.targetWord,
// //                   isGameOver: game.isGameOver(),
// //                   isSubmitted: true,
// //                   currentGuess: currentGuess,
// //                 ),
// //               ),
// //             ),
// //             // Virtual Keyboard
// //             Padding(
// //               padding: const EdgeInsets.symmetric(vertical: 10),
// //               child: WordleKeyboard(
// //                 onKeyPress: _onKeyPress,
// //                 keyColors: keyColors,
// //                 onSubmit: () {
// //                   if (currentGuess.length == game.targetWord.length) {
// //                     game.guessWord(currentGuess);
// //                     _updateKeyColors();
// //                     if (game.hasWon()) {
// //                       _updateScore();
// //                       _showResultDialog(true);
// //                     } else if (game.isGameOver()) {
// //                       highScore = totalScore; // Set high score
// //                       _showResultDialog(false);
// //                     }
// //                     currentGuess = "";
// //                   }
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import '../widgets/wordle_keyboard.dart';
import '../widgets/guess_grid.dart';
import '../model/wordle_game.dart';

class GameScreen extends StatefulWidget {
  final String selectedDifficulty;

  GameScreen({required this.selectedDifficulty});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late WordleGame game;
  String currentGuess = "";
  Map<String, Color> keyColors = {};
  int totalScore = 0; // Track cumulative score
  int highScore = 0; // Store high score

  @override
  void initState() {
    super.initState();
    game = WordleGame(widget.selectedDifficulty, 5);
  }

  void _onKeyPress(String letter) {
    setState(() {
      if (letter == "BACKSPACE") {
        if (currentGuess.isNotEmpty) {
          currentGuess = currentGuess.substring(0, currentGuess.length - 1);
        }
      } else if (letter == "ENTER") {
        if (currentGuess.length == game.targetWord.length) {
          game.guessWord(currentGuess);
          _updateKeyColors();
          if (game.hasWon()) {
            _updateScore();
            _showResultDialog(true);
          } else if (game.isGameOver()) {
            _updateHighScore();
            _showResultDialog(false);
          }
          currentGuess = "";
        }
      } else if (currentGuess.length < game.targetWord.length) {
        currentGuess += letter;
      }
    });
  }

  void _updateScore() {
    setState(() {
      int roundScore = (game.maxAttempts - game.guessedWords.length) * 100;
      totalScore += roundScore;
    });
  }

  void _updateHighScore() {
    setState(() {
      if (totalScore > highScore) {
        highScore = totalScore;
      }
    });
  }

  void _showResultDialog(bool won) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(won ? 'Correct!' : 'Game Over'),
          content: Text(
            won
                ? 'You guessed the word correctly!'
                : 'You ran out of attempts. Your current high score is $highScore.',
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                if (won) {
                  _startNextRound();
                } else {
                  _resetGame();
                }
              },
              child: Text(won ? 'Continue' : 'Play Again'),
            ),
          ],
        );
      },
    );
  }

  void _startNextRound() {
    setState(() {
      game = WordleGame(widget.selectedDifficulty, 5);
      currentGuess = "";
      keyColors.clear();
    });
  }

  void _resetGame() {
    setState(() {
      game = WordleGame(widget.selectedDifficulty, 5);
      currentGuess = "";
      totalScore = 0;
      keyColors.clear();
    });
  }

  void _updateKeyColors() {
    for (int i = 0; i < game.targetWord.length; i++) {
      String letter = currentGuess[i];
      Color newColor = _getKeyColor(letter, i);
      keyColors[letter] = newColor;
    }
    setState(() {});
  }

  Color _getKeyColor(String letter, int index) {
    if (game.targetWord[index] == letter) {
      return Colors.green.shade800;
    } else if (game.targetWord.contains(letter)) {
      return Colors.yellow.shade700;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${game.antas}'),
        centerTitle: true,
      ),
      body: Container(
        color: game.colors,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // High Score and Total Score Display
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                child: Row(
                  children: [
                    Container(
                      width: 177,
                      child: Row(
                        children: [
                          Icon(
                            Icons.emoji_events_rounded,
                            size: 30,
                            color: const Color.fromARGB(255, 0, 106, 4),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "$highScore",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 120,
                      child: Center(
                        child: Text(
                          "$totalScore",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 50,
                    )
                  ],
                ),
              ),
            ),
            // Guess Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GuessGrid(
                  guessedWords: game.guessedWords,
                  targetWord: game.targetWord,
                  isGameOver: game.isGameOver(),
                  isSubmitted: true,
                  currentGuess: currentGuess,
                ),
              ),
            ),
            // Virtual Keyboard
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: WordleKeyboard(
                onKeyPress: _onKeyPress,
                keyColors: keyColors,
                onSubmit: () {
                  if (currentGuess.length == game.targetWord.length) {
                    game.guessWord(currentGuess);
                    _updateKeyColors();
                    if (game.hasWon()) {
                      _updateScore();
                      _showResultDialog(true);
                    } else if (game.isGameOver()) {
                      _updateHighScore();
                      _showResultDialog(false);
                    }
                    currentGuess = "";
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
