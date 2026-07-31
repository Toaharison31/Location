import 'dart:io';

import 'personne_model.dart';

// classe Proprietaire
class ProprietaireModel extends PersonneModel{  
  int nombreMotos;
  String dateInscription;
  String role;

  // constructeur
  ProprietaireModel({
    // required super.idPersonne,
    required super.nom,
    required super.prenom,
    required super.dateNaissance,
    required super.lieuNaissance,
    required super.numeroCin,
    required super.image,
    required super.adresse,
    required super.telephone,
    required super.telephone2,
    required super.email,
    required this.nombreMotos,
    required this.dateInscription,
    required this.role,
  });

  // validation du formulaire
  bool get isValidProprietaire {
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
      nombreMotos.toString(),
      dateInscription,
      role,
    ];

    bool verifierTexte = fields.any((field) => field.trim().isEmpty);

    if (verifierTexte) {
      return false;
    }

    return true;
  }

  // mampiditra personne proprietaire
  Map<String, dynamic> toMapProprietaire() => {
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
    'nombreMotos': nombreMotos,
    'dateInscription': dateInscription,
    'role': role,
  };

  // query mamoaka
  factory ProprietaireModel.fromMapProprietaire(Map<String, dynamic> map) => ProprietaireModel(
      // idPersonne: map['idPersonne'],
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
      nombreMotos: map['nombreMotos'],
      dateInscription: map['dateInscription'],
      role: map['role'],
    );
}
