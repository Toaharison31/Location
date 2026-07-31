import 'dart:io';
import 'package:flutter/material.dart';
import '../models/personne_model.dart';
import '../services/personne_service.dart';
import 'package:image_picker/image_picker.dart';

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

  File? imageFile;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inscription')),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
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

            SizedBox(height: 5),

            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  TextField(
                    controller: nomController,
                    decoration: const InputDecoration(
                      hintText: 'nom',
                      labelText: 'Nom',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),

                  const SizedBox(height: 5),

                  TextField(
                    controller: prenomController,
                    decoration: InputDecoration(
                      hintText: 'prénom',
                      labelText: 'Prénom',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),

                  const SizedBox(height: 5),

                  TextFormField(
                    controller: dateNaissanceController,
                    decoration: InputDecoration(
                      hintText: 'jj/mm/aaaa',
                      labelText: 'Date de naissance',
                      icon: Icon(Icons.cake),
                    ),
                  ),

                  const SizedBox(height: 5),

                  TextField(
                    controller: lieuNaissanceController,
                    decoration: InputDecoration(
                      hintText: 'lieu de naissance',
                      labelText: 'Lieu de naissance',
                      icon: Icon(Icons.location_on),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 5),

            TextFormField(
              controller: numeroCinController,
              decoration: InputDecoration(
                hintText: 'numero CIN',
                labelText: 'CIN',
                icon: Icon(Icons.badge),
              ),
            ),

            const SizedBox(height: 5),

            TextField(
              controller: sexeController,
              decoration: InputDecoration(
                hintText: 'homme/femme',
                labelText: 'Sexe',
                icon: Icon(Icons.wc),
              ),
            ),

            SizedBox(height: 5),

            TextFormField(
              controller: adresseController,
              decoration: InputDecoration(
                hintText: 'addresse',
                labelText: 'Adresse',
                icon: Icon(Icons.home),
              ),
            ),

            const SizedBox(height: 5),

            TextFormField(
              controller: telephoneController,
              decoration: InputDecoration(
                hintText: 'tel1',
                labelText: 'Téléphone 1',
                icon: Icon(Icons.phone),
              ),
            ),

            SizedBox(height: 5),

            TextFormField(
              controller: telephone2Controller,
              decoration: InputDecoration(
                hintText: 'tel2',
                labelText: 'Téléphone 2',
                icon: Icon(Icons.phone),
              ),
            ),

            SizedBox(height: 5),

            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: '...@gmail.com',
                labelText: 'Mail',
                icon: Icon(Icons.mail),
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: FilledButton(
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
                child: const Text('S`inscrire'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
