import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

  // mampiditra image
  Future<void> choisirPhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);

    if (photo != null) {
      setState(() {
        imageFile = File(photo.path);
      });
    }
  }

  // Formulaire
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50, width: 0),

          TextField(
            controller: nomController,
            decoration: InputDecoration(
              labelText: "Nom",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          TextField(
            controller: prenomController,
            decoration: InputDecoration(
              labelText: "Prénom",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          TextField(controller: dateNaissanceController),
          TextField(controller: lieuNaissanceController),
          TextField(controller: numeroCinController),
          TextField(controller: sexeController),
          Center(
            child: imageFile == null
                ? const Icon(Icons.person, size: 100)
                : Image.file(
                    imageFile!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
          ),
          ElevatedButton.icon(
            onPressed: choisirPhoto,
            icon: const Icon(Icons.photo),
            label: const Text('Choisir'),
          ),
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
                debugPrint("Personne ajouté!");
              } else {
                debugPrint("Erreur lors de l'ajout personne.");
              }
            },

            child: const Text("Créer un compte"),
          ),
        ],
      ),
    );
  }
}
