// import 'package:flutter/material.dart';

// class DifficultySelectionScreen extends StatelessWidget {
//   final Function(String) onDifficultySelected;

//   DifficultySelectionScreen({required this.onDifficultySelected});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.brown,
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(30.0),
//             child: Text(
//               "Talatinigan",
//               style: TextStyle(
//                   fontFamily: "Poppins",
//                   fontSize: 50,
//                   fontWeight: FontWeight.w800,
//                   color: Colors.white),
//             ),
//           ),
//           SizedBox(
//             height: 40,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20.0),
//             child: Text(
//               "Pumili ng Antas",
//               style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.w800,
//                   color: Colors.white),
//             ),
//           ),
//           Center(
//             child: Container(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   DifficultyTile(
//                       titik: "Apat na Letra",
//                       label: 'Baguhan',
//                       onTap: () => onDifficultySelected('baguhan'),
//                       kulay: Color(0xFFF1E1C6)),
//                   DifficultyTile(
//                       titik: "Limang Letra",
//                       label: 'Beterano',
//                       onTap: () => onDifficultySelected('beterano'),
//                       kulay: Color.fromARGB(255, 214, 214, 214)),
//                   DifficultyTile(
//                       titik: "Anim na Letra",
//                       label: 'Alamat',
//                       onTap: () => onDifficultySelected('alamat'),
//                       kulay: Color.fromARGB(255, 246, 217, 55)),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DifficultyTile extends StatelessWidget {
//   final String titik;
//   final String label;
//   final VoidCallback onTap;
//   final Color kulay;

//   DifficultyTile({
//     required this.label,
//     required this.onTap,
//     required this.titik,
//     required this.kulay,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 10),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(
//             color: Colors.white, // Border color
//             width: 5, // Border width
//           ),
//         ),
//         child: ListTile(
//           contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
//           tileColor: kulay,
//           titleAlignment: ListTileTitleAlignment.center,
//           title: Text(
//             label,
//             style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.w500,
//                 color: Color(0xFF333333),
//                 fontFamily: "Poppins"),
//           ),
//           subtitle: Text(
//             titik,
//             style: TextStyle(color: Colors.brown),
//           ),
//           onTap: onTap,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class DifficultySelectionScreen extends StatelessWidget {
  final Function(String) onDifficultySelected;

  DifficultySelectionScreen({required this.onDifficultySelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "Talatinigan",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 50,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "Pumili ng Antas",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                DifficultyTile(
                  titik: "Apat na Letra",
                  label: 'Baguhan',
                  onTap: () => onDifficultySelected('baguhan'),
                  kulay: Color(0xFFF1E1C6),
                ),
                DifficultyTile(
                  titik: "Limang Letra",
                  label: 'Beterano',
                  onTap: () => onDifficultySelected('beterano'),
                  kulay: Color.fromARGB(255, 214, 214, 214),
                ),
                DifficultyTile(
                  titik: "Anim na Letra",
                  label: 'Alamat',
                  onTap: () => onDifficultySelected('alamat'),
                  kulay: Color.fromARGB(255, 255, 233, 111),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DifficultyTile extends StatelessWidget {
  final String titik;
  final String label;
  final VoidCallback onTap;
  final Color kulay;

  DifficultyTile({
    required this.label,
    required this.onTap,
    required this.titik,
    required this.kulay,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.white, width: 3),
        ),
        color: kulay,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          titleAlignment: ListTileTitleAlignment.center,
          title: Text(
            label,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
              fontFamily: "Poppins",
            ),
          ),
          subtitle: Text(
            titik,
            style: TextStyle(color: Colors.brown),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
