import '../database/database_helper.dart';
import '../models/personne_model.dart';

// place de la logique des donées
class PersonneService {
  // enregistrement
  Future<bool> register(Personne personne) async {
    // vérification
    if (personne.email.isEmpty) {
      return false;
    }

    if (personne.password.length < 8) {
      return false;
    }

    final data = DatabaseHelper.instance;
    int id = await data.register(personne);
    
    return id > 0;
  }

  // Mamerina query affichage
  Future<List<Personne>> getPersonnes() async {
    return await DatabaseHelper.instance.getAllPersonne();
  } 
}
