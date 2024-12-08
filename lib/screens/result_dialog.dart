// import 'package:flutter/material.dart';

// class ResultDialog extends StatelessWidget {
//   final bool hasWon;
//   final int score;
//   final VoidCallback onPlayAgain;

//   const ResultDialog({
//     required this.hasWon,
//     required this.score,
//     required this.onPlayAgain,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text(hasWon ? 'Congratulations!' : 'Game Over'),
//       content: Text(
//         hasWon
//             ? 'You guessed the word!'
//             : 'You ran out of attempts. Try again!',
//       ),
//       actions: [
//         ElevatedButton(
//           onPressed: onPlayAgain,
//           child: Text('Play Again'),
//         ),
//       ],
//     );
//   }
// }
