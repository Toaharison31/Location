import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/register_service.dart';

class RegisterScreen extends StatefulWidget{
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
                TextField(
                    controller: emailController,
                ),

                TextField(
                    controller: passwordController,
                ),
                
                // Mamdefa requête any amin'ny backend
                ElevatedButton(
                    onPressed: () {
                        final user = User(
                            email: emailController.text,
                            password: passwordController.text
                        );

                        final service = UserService();

                        bool resultat = service.register(user);
                        if (resultat) {
                            debugPrint("Compte créé");
                        }
                        else {
                            debugPrint("Erreur");
                        }
                    },

                    child: const Text("Créer un compte"),
                ),
            ],
        ),
    );
  }
}

