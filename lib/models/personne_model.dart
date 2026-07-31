// Classe Personne
import 'dart:io';

class PersonneModel {
  int? idPersonne;
  String nom;
  String prenom;
  String dateNaissance;
  String lieuNaissance;
  String numeroCin;
  File? image;
  String adresse;
  String telephone;
  String telephone2;
  String email;

  // constructeur
  PersonneModel({
    this.idPersonne,
    required this.nom,
    required this.prenom,
    required this.dateNaissance,
    required this.lieuNaissance,
    required this.numeroCin,
    this.image,
    required this.adresse,
    required this.telephone,
    required this.telephone2,
    required this.email,
  });

  // validation du formulaire
  bool get isValidPersonne {
    final fields = [
      nom,
      prenom,
      dateNaissance,
      lieuNaissance,
      numeroCin,
      adresse,
      telephone,
      telephone2,
      email,
    ];

    bool verifierTexte = fields.any((field) => field.trim().isEmpty);

    if (verifierTexte) {
      return false;
    }
    return true;
  }

  // liste mampiditra
  Map<String, dynamic> toMapPersonne() => {
    'idPersonne': idPersonne,
    'nom': nom,
    'prenom': prenom,
    'dateNaissance': dateNaissance,
    'lieuNaissance': lieuNaissance,
    'numeroCin': numeroCin,
    'image': image?.path,
    'adresse': adresse,
    'telephone': telephone,
    'telephone2': telephone2,
    'email': email,
  };

  // query mamoaka
  factory PersonneModel.fromMapPersonne(Map<String, dynamic> map) => PersonneModel(
    idPersonne: map['idPersonne'],
    nom: map['nom'],
    prenom: map['prenom'],
    dateNaissance: map['dateNaissance'],
    lieuNaissance: map['lieuNaissance'],
    numeroCin: map['numeroCin'],
    image: map['image'] != null ? File(map['image']) : null,
    adresse: map['adresse'],
    telephone: map['telephone'],
    telephone2: map['telephone2'],
    email: map['email'],
  );
}
