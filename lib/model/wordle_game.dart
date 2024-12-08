import 'dart:math';
import 'package:flutter/material.dart';

class WordleGame {
  final List<String> easyWords = [
    'ARAW',
    'GABI',
    'TAYO',
    'MESA',
    'PUNO',
    'TUBO',
    'MATA',
    'BASA',
    'ULAN',
    'ISLA'
  ];

  final List<String> mediumWords = [
    'DAGAT',
    'BAGYO',
    'LIKHA',
    'MUNDO',
    'SULAT',
    'BAYAN',
    'TUBIG',
    'BULAK',
    'KAPWA',
    'BUWAN'
  ];

  final List<String> difficultWords = [
    'SALITA',
    'PANALO',
    'LABABO',
    'BANGON',
    'PALAKA',
    'SAYANG',
    'LAMESA',
    'TUKTOK',
    'BITUIN',
    'LANGIT'
  ];

  late String antas;
  late Color colors;
  late String targetWord;
  late int maxAttempts;
  late int gridRows; // To store the number of grid rows based on difficulty
  List<String> guessedWords = [];
  bool gameOver = false;
  bool won = false;

  int cumulativeScore = 0; // Tracks the total score across rounds
  int wordsGuessedCorrectly = 0; // Tracks the number of words guessed correctly

  WordleGame(String difficulty, this.maxAttempts) {
    setDifficulty(difficulty);
  }

  void setDifficulty(String difficulty) {
    Random random = Random();
    switch (difficulty) {
      case 'baguhan':
        antas = "Baguhan";
        colors = Color(0xFFF1E1C6);
        targetWord = easyWords[random.nextInt(easyWords.length)];
        gridRows = 4; // Easy = 4 rows
        break;
      case 'beterano':
        antas = "Beterano";
        colors = Color(0xFFC0C0C0);
        targetWord = mediumWords[random.nextInt(mediumWords.length)];
        gridRows = 5; // Medium = 5 rows
        break;
      case 'alamat':
        antas = "Alamat";
        colors = Color.fromARGB(255, 255, 233, 111);
        targetWord = difficultWords[random.nextInt(difficultWords.length)];
        gridRows = 6; // Difficult = 6 rows
        break;
      default:
        targetWord = mediumWords[random.nextInt(mediumWords.length)];
        gridRows = 5; // Default to medium (5 rows)
        break;
    }
  }

  int getGridRows() {
    return gridRows; // Return the number of rows for the grid
  }

  void guessWord(String guess) {
    if (guess == targetWord) {
      won = true;
      gameOver = true;
      wordsGuessedCorrectly++;
      cumulativeScore +=
          (maxAttempts - guessedWords.length) * 100; // Example scoring
    } else {
      guessedWords.add(guess);
      if (guessedWords.length >= maxAttempts) {
        gameOver = true;
      }
    }
  }

  void resetGameForNextWord() {
    // Reset the state while retaining cumulative score
    Random random = Random();
    guessedWords.clear();
    gameOver = false;
    won = false;

    // Set a new word for the next round
    switch (antas) {
      case "Baguhan":
        targetWord = easyWords[random.nextInt(easyWords.length)];
        break;
      case "Beterano":
        targetWord = mediumWords[random.nextInt(mediumWords.length)];
        break;
      case "Alamat":
        targetWord = difficultWords[random.nextInt(difficultWords.length)];
        break;
    }
  }

  void resetGame() {
    // Reset everything including the score and guessed words
    guessedWords.clear();
    gameOver = false;
    won = false;
    cumulativeScore = 0;
    wordsGuessedCorrectly = 0;
    setDifficulty(antas);
  }

  bool isGameOver() => gameOver;
  bool hasWon() => won;
}
