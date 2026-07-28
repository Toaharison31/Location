import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/user_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(controller: emailController),
          TextField(controller: passwordController),

          // Mamdefa requête any amin'ny backend
          ElevatedButton(
            onPressed: () async {
              final user = User(
                email: emailController.text,
                password: passwordController.text,
              );
              final service = UserService();

              bool resultat = await service.register(user);
              if (resultat) {
                debugPrint("Compte créé avec succès!");
              } else {
                debugPrint("Erreur lors de la création du compte.\nVeuillez completer tous les champs.");
              }
            },

            child: const Text("Créer un compte"),
          ),
        ],
      ),
    );
  }
}
