import 'package:flutter/material.dart';
import '../models/personne_model.dart';
import '../services/personne_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  /********************************************************* */
  /**les autres: jereo dia ataovy mitovy model.personne_model*/

  /********************************************************* */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(controller: nomController),
          TextField(controller: prenomController),

          /********************************************************* */
          /**les autres: jereo dia ataovy mitovy model.personne_model*/

          /********************************************************* */

          // Mamdefa requête any amin'ny backend
          ElevatedButton(
            onPressed: () async {
              final personne = Personne(
                nom: nomController.text,
                prenom: prenomController.text,

                /********************************************************* */
                /**les autres: jereo dia ataovy mitovy model.personne_model*/

                /********************************************************* */
              );
              final service = PersonneService();
              bool resultat = await service.ajouterPersonne(personne);

              // Message de validation
              if (resultat) {
                debugPrint("Compte créé avec succès!");
              } else {
                debugPrint(
                  "Erreur lors de la création du compte.\nVeuillez completer tous les champs.",
                );
              }
            },

            child: const Text("Créer un compte"),
          ),
        ],
      ),
    );
  }
}
