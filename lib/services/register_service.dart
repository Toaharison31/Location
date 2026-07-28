import '../models/user.dart';

class UserService {
    bool register(User user) {
        // vérification
        if(user.email.isEmpty) {
            return false;
        }

        if(user.password.length < 8) {
            return false;
        }

        // place de la logique de calcul
        return true;

        // place de la logique des donées
        // db_helper.insert(user);
    }
}