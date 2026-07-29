// Classe Personne
class Personne {
  int? idPersonne;
  String nom;
  String prenom;
  String dateNaissance;
  String lieuNaissance;
  String numeroCin;
  String sexe;
  String? image;
  String adresse;
  String telephone;
  String telephone2;
  String email;

  // constructeur
  Personne({
    this.idPersonne,
    required this.nom,
    required this.prenom,
    required this.dateNaissance,
    required this.lieuNaissance,
    required this.numeroCin,
    required this.sexe,
    this.image,
    required this.adresse,
    required this.telephone,
    required this.telephone2,
    required this.email,
  });

  // validation du formulaire
  bool get isValid {
    final fields = [
      nom,
      prenom,
      dateNaissance,
      lieuNaissance,
      numeroCin,
      sexe,
      adresse,
      telephone,
      telephone2,
      email,
    ];

    bool verifierTexte = fields.any((field) => field.trim().isEmpty);

    bool verifierImage = image == null || image!.isEmpty;

    if (verifierTexte || verifierImage) {
      return false;
    }

    return true;
  }

  // liste mampiditra
  Map<String, dynamic> toMap() => {
    'idPersonne': idPersonne,
    'nom': nom,
    'prenom': prenom,
    'dateNaissance': dateNaissance,
    'lieuNaissance': lieuNaissance,
    'numeroCin': numeroCin,
    'sexe': sexe,
    'image': image,
    'adresse': adresse,
    'telephone': telephone,
    'telephone2': telephone2,
    'email': email,
  };

  // query mamoaka
  factory Personne.fromMap(Map<String, dynamic> map) => Personne(
    idPersonne: map['idPersonne'],
    nom: map['nom'],
    prenom: map['prenom'],
    dateNaissance: map['dateNaissance'],
    lieuNaissance: map['lieuNaissance'],
    numeroCin: map['numeroCin'],
    sexe: map['sexe'],
    image: map['image'],
    adresse: map['adresse'],
    telephone: map['telephone'],
    telephone2: map['telephone2'],
    email: map['email'],
  );
}
