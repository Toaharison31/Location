// Classe Utilisateur
class User {
  int? id;
  String email;
  String password;

  // constructeur
  User({this.id, required this.email, required this.password});

  // liste mampiditra
  Map<String, dynamic> toMap() => {
    'id': id,
    'email': email,
    'password': password,
  };

  // query mamoaka
  factory User.fromMap(Map<String, dynamic> map) =>
      User(id: map['id'], email: map['email'], password: map['password']);
}
