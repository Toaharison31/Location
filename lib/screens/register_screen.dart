import 'dart:io';
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
  final dateNaissanceController = TextEditingController();
  final lieuNaissanceController = TextEditingController();
  final numeroCinController = TextEditingController();
  final sexeController = TextEditingController();
  File?   imageFile;

  
  final adresseController = TextEditingController();
  final telephoneController = TextEditingController();
  final telephone2Controller = TextEditingController();
  final emailController = TextEditingController();

  // Formulaire
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: nomController,
            decoration: InputDecoration(
              hintText: "nom...",
              labelText: "Nom",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          TextField(controller: prenomController),
          TextField(controller: dateNaissanceController),
          TextField(controller: lieuNaissanceController),
          TextField(controller: numeroCinController),
          TextField(controller: sexeController),
          imageFile != null
            ? Image.file(
              imageFile!,
              width: 150,
              height: 150,)
            :const Text("Auccun image n'est selectionné"),
          TextField(controller: adresseController),
          TextField(controller: telephoneController),
          TextField(controller: telephone2Controller),
          TextField(controller: emailController),

          // Mamdefa resultat any amin'ny backend
          ElevatedButton(
            onPressed: () async {
              final personne = PersonneModel(
                nom: nomController.text,
                prenom: prenomController.text,
                dateNaissance: dateNaissanceController.text,
                lieuNaissance: lieuNaissanceController.text,
                numeroCin: numeroCinController.text,
                sexe: sexeController.text,
                image: imageFile,
                adresse: adresseController.text,
                telephone: telephoneController.text,
                telephone2: telephone2Controller.text,
                email: emailController.text,
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
