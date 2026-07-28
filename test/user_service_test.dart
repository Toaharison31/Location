import 'package:flutter_test/flutter_test.dart';
import 'package:taxi/models/user.dart';
import 'package:taxi/services/user_service.dart';

void main(){
    /* vérification si les informations valides */
    test('Informations valides', () {
        final service = UserService();

        final user = User(
            email: "test@gmail.com",
            password: "password123"
        );

        expect(service.register(user), true);
    });

    /* vérification si email vide */
    test('Échec si email vide', () {
        final service = UserService();

        final user = User(
            email: "",
            password: "password123"
        );

        expect(service.register(user), false);
    });

    /* vérification si mot de passe court */
    test('Échec si mot de passe court', () {
        final service = UserService();

        final user = User(
            email: "test@gmail.com",
            password: "pass123"
        );

        expect(service.register(user), false);
    });

}