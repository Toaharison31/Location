import '../database/database_helper.dart';
import '../models/personne_model.dart';

// place de la logique des donées
class PersonneService {
  // enregistrement
  Future<bool> ajouterPersonne(Personne personne) async {
    // vérification ou validation
    if (personne.isValid) {
      return false;
    }

    final data = DatabaseHelper.instance;
    int id = await data.ajouterPersonne(personne);

    return id > 0;
  }

  // Mamerina query affichage
  Future<List<Personne>> getPersonnes() async {
    return await DatabaseHelper.instance.getAllPersonnes();
  }
}
