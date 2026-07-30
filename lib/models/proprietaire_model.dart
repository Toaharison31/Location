import 'personne_model.dart';

// classe Proprietaire
class ProprietaireModel {
  final PersonneModel personneModel; // heritage

  int? idProprietaire;
  int nombreMotos;
  String dateInscription;
  String role;

  // constructeur
  ProprietaireModel({
    required this.personneModel,

    this.idProprietaire,
    required this.nombreMotos,
    required this.dateInscription,
    required this.role,
  });

    // validation du formulaire
  bool get isValid {
    final fields = [
      personneModel.nom,
      personneModel.prenom,
      personneModel.dateNaissance,
      personneModel.lieuNaissance,
      personneModel.numeroCin,
      personneModel.sexe,
      personneModel.adresse,
      personneModel.telephone,
      personneModel.telephone2,
      personneModel.email,
      nombreMotos.toString(),
      dateInscription,
      role
    ];

    bool verifierTexte = fields.any((field) => field.trim().isEmpty);

    // bool verifierImage = personneModel.image == null || personneModel.image!.isEmpty;

    if (verifierTexte) {
      return false;
    }

    return true;
  }
}
