// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelper {
//   //DB Constants
//   static const String dbName = 'talatinigan.db';
//   static const int dbVersion = 1;

//   static const String talaDb = 'scores';
//   static const String userId = 'userId';
//   static const String roundId = 'round';
//   static const String score = 'score';
//   static const String difficulty = 'diff';

//   void openDb() async {
//     var path = join(await getDatabasesPath(), dbName);
//     var createSql = '''CREATE TABLE IF NOT EXISTS $talaDb (
//      $userId INTEGER PRIMARY KEY AUTOINCREMENT,
//      $roundId TEXT,
//      $score INTEGER,
//     );
//     ''';
//     openDatabase(path, version: dbVersion, onCreate: (dbName, version) {
//       dbName.execute(createSql);
//     }, onUpgrade: (dbName, oldVersion, newVersion) {
//       if (newVersion <= oldVersion) return;
//       dbName.execute('DROP TABLE IF EXISTS $talaDb');
//       dbName.execute(createSql);
//     });
//     print('db opened');
//   }
//   // static final DatabaseHelper _instance = DatabaseHelper._internal();

//   // factory DatabaseHelper() => _instance;

//   // DatabaseHelper._internal();

//   // Future<Database> get database async {
//   //   final path = await getDatabasesPath();
//   //   return openDatabase(
//   //     join(path, 'word_guesser.db'),
//   //     onCreate: (db, version) {
//   //       return db.execute(
//   //         'CREATE TABLE words(id INTEGER PRIMARY KEY, word TEXT, definition TEXT)',
//   //       );
//   //     },
//   //     version: 1,
//   //   );
//   // }

//   // Methods to insert, retrieve, and delete data
// }
