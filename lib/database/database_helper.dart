import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/personne_model.dart';

class DatabaseHelper {
  // Singleton
  static final DatabaseHelper instance = DatabaseHelper._internal();
  DatabaseHelper._internal();

  static Database? _database;

  // Refresh database raha efa misy
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Create database raha mbola tsy misy
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'location.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute("""
          CREATE TABLE personne(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT NOT NULL,
            password TEXT NOT NULL
          );
      """);
  }

  // CRUD OPERATIONS

  // Insertion de l'utilisateur
  Future<int> ajouterPersonne(Personne personne) async {
    final db = await database;
    return await db.insert('personne', personne.toMap());
  }

  // Affichage
  Future<List<Personne>> getAllPersonnes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('personne');
    return maps.map((map) => Personne.fromMap(map)).toList();
  }
}
