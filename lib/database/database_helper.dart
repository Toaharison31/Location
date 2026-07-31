import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
//import '../models/personne_model.dart';
import '../models/proprietaire_model.dart';

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
    String path = join(await getDatabasesPath(), 'test1.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute("""
          CREATE TABLE personne(
            idPersonne INTEGER PRIMARY KEY AUTOINCREMENT,
            nom TEXT NOT NULL,
            prenom TEXT NOT NULL,
            dateNaissance TEXT NOT NULL,
            lieuNaissance TEXT NOT NULL,
            numeroCin TEXT NOT NULL,
            image TEXT NOT NULL,
            adresse TEXT NOT NULL,
            telephone TEXT NOT NULL,
            telephone2 TEXT,
            email TEXT
          );

          CREATE TABLE proprietaire(
            idProprietaire INTEGER PRIMARY KEY REFERENCES personne(idPersonne),
            nombreMotos INTEGER NOT NULL,
            dateInscription TEXT NOT NULL,
            role TEXT CHECK(role IN('Admin', 'Manager'))
          );
      """);
  }

  // CRUD OPERATIONS

  // Insertion de personne
  /*Future<int> ajouterPersonne(
    PersonneModel personne,
  ) async {
    final db = await database;
    return await db.insert('personne', personne.toMapPersonne());
  }*/

  // insertion proprietaire
  Future<int> ajouterProprietaire(
    ProprietaireModel proprietaire,
  ) async {
    final db = await database;
    return await db.insert('proprietaire', proprietaire.toMapProprietaire());
  }

  // Affichage
  Future<List<ProprietaireModel>> getAllPersonnes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('proprietaire');
    return maps.map((map) => ProprietaireModel.fromMapProprietaire(map)).toList();
  }

  
}
