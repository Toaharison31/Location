import '../database/database_helper.dart';
import '../models/user.dart';

// place de la logique des donées
class UserService {
  // enregistrement
  Future<bool> register(User user) async {
    // vérification
    if (user.email.isEmpty) {
      return false;
    }

    if (user.password.length < 8) {
      return false;
    }

    final data = DatabaseHelper.instance;
    int id = await data.register(user);
    
    return id > 0;
  }

  // Mamerina query affichage
  Future<List<User>> getUsers() async {
    return await DatabaseHelper.instance.getAllUser();
  } 
}
