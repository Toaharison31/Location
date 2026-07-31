import 'package:taxi/models/proprietaire_model.dart';

import '../database/database_helper.dart';
// import '../models/personne_model.dart';

// place de la logique des donées
class PersonneService {
  // enregistrement
  Future<bool> ajouterProprietaire(ProprietaireModel proprietaire) async {
    // vérification ou validation
    if (!proprietaire.isValidProprietaire) {
      return false;
    }

    final data = DatabaseHelper.instance;
    int id = await data.ajouterProprietaire(proprietaire);

    return id > 0;
  }

  // Mamerina query affichage
  Future<List<ProprietaireModel>> getPersonnes() async {
    return await DatabaseHelper.instance.getAllPersonnes();
  }
}
