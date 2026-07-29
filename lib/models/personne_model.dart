// Classe Utilisateur
class Personne {
  int? id;
  String email;
  String password;

  // constructeur
  Personne({this.id, required this.email, required this.password});

  // liste mampiditra
  Map<String, dynamic> toMap() => {
    'id': id,
    'email': email,
    'password': password,
  };

  // query mamoaka
  factory Personne.fromMap(Map<String, dynamic> map) =>
      Personne(id: map['id'], email: map['email'], password: map['password']);
}


/**
 * id_personne | nom | prenom | date_naissance | lieu_naissance | 
sexe | image | telephone | telephone2 | adresse | email |
numero_cin | date_cin | lieu_cin
 */