// import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi/models/proprietaire_model.dart';
// import '../models/personne_model.dart';
import '../services/personne_service.dart';
import 'read_screen.dart';

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
  final nombreMotosController = TextEditingController();
  final dateInscriptionController = TextEditingController();
  final roleController = TextEditingController();

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

      //bouton en bas à droite
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ReadScreen()));
        },
        icon: Icon(Icons.list), 
        label: Text('listes'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: .start,
          children: [
            Center(
              child: imageFile == null
                  ? const Icon(Icons.person, size: 40)
                  : Image.file(
                      imageFile!,
                      width: 300,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
            ),

            ElevatedButton.icon(
              onPressed: choisirPhoto,
              icon: const Icon(Icons.photo),
              label: const Text('Choisir'),
            ),

            SizedBox(height: 1),

            Padding(
              padding: const EdgeInsets.all(0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    
                    TextField(
                      controller: nomController,
                      decoration: const InputDecoration(
                        hintText: 'nom',
                        labelText: 'Nom',
                        
                      ),
                    ),

                    const SizedBox(height: 5),

                    TextField(
                      controller: prenomController,
                      decoration: InputDecoration(
                        hintText: 'prénom',
                        labelText: 'Prénom',
                        
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

                    const SizedBox(height: 1),

                    TextFormField(
                      controller: numeroCinController,
                      decoration: InputDecoration(
                        hintText: 'numero CIN',
                        labelText: 'CIN',
                        icon: Icon(Icons.badge),
                      ),
                    ),

                    const SizedBox(height: 1),

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
                        icon: Icon(Icons.phone_in_talk)                       
                      ),
                    ),

                    const SizedBox(height: 1),

                    TextFormField(
                      controller: telephone2Controller,
                      decoration: InputDecoration(
                        hintText: 'tel2',
                        labelText: 'Téléphone 2',
                        icon: Icon(Icons.phone)
                      ),
                    ),

                    const SizedBox(height: 1),

                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: '...@gmail.com',
                        labelText: 'Mail',
                        icon: Icon(Icons.mail),
                      ),
                    ),

                    const SizedBox(height: 1),

                    TextFormField(
                      controller: nombreMotosController,
                      decoration: InputDecoration(
                        hintText: 'nombre motos',
                        labelText: 'Nombre motos',
                        icon: Icon(Icons.motorcycle),
                      ),
                    ),

                    const SizedBox(height: 1),

                    TextFormField(
                      controller: dateInscriptionController,
                      decoration: InputDecoration(
                        hintText: 'date d\'inscription',
                        labelText: 'Date d\'inscription',
                        icon: Icon(Icons.date_range),
                      ),
                    ),

                    const SizedBox(height: 1),

                    TextFormField(
                      controller: roleController,
                      decoration: InputDecoration(
                        hintText: 'rôle',
                        labelText: 'Role',
                        icon: Icon(Icons.roller_shades),
                      ),
                    ),

                    const SizedBox(height: 10,),

                    Center(
                      child: FilledButton(
                        onPressed: () async {
                          final proprietaire = ProprietaireModel(
                            nom: nomController.text,
                            prenom: prenomController.text,
                            dateNaissance: dateNaissanceController.text,
                            lieuNaissance: lieuNaissanceController.text,
                            numeroCin: numeroCinController.text,
                            image: imageFile,
                            adresse: adresseController.text,
                            telephone: telephoneController.text,
                            telephone2: telephone2Controller.text,
                            email: emailController.text,
                            nombreMotos: int.parse(nombreMotosController.text),
                            dateInscription: dateInscriptionController.text,
                            role: roleController.text,
                          );

                          final service = PersonneService();
                          bool resultat = await service.ajouterProprietaire(
                            proprietaire,
                          );

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
            ),
          ],
        ),
        ),
      ),
    );
  }
}
