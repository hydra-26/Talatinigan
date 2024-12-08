import 'package:flutter/material.dart';
import 'game_screen.dart';
import 'difficulty_selection_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'), // Path to your image
            fit: BoxFit.cover, // Ensures the image covers the entire background
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 1,
              ),
              Text(
                'Talatinigan',
                style: TextStyle(
                  color: const Color(0xFF22120A),
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/Logo.png',
                  width: 250, // Adjust width as needed
                  height: 250, // Adjust height as needed
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DifficultySelectionScreen(
                        onDifficultySelected: (selectedDifficulty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GameScreen(
                                  selectedDifficulty: selectedDifficulty),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                child: Text(
                  'Manghula Na!',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins"),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF22120A),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 25),
                  // minimumSize: Size(350, 100),
                  shape: RoundedRectangleBorder(
                    // Rounded corners
                    borderRadius: BorderRadius.circular(15), // Border radius
                    side: BorderSide(
                      // Border properties
                      color: Colors.white, // Border color
                      width: 2, // Border width
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
