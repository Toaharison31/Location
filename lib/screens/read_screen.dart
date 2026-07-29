import 'package:flutter/material.dart';
import '../models/personne_model.dart';
import '../services/user_service.dart';

class ReadScreen extends StatelessWidget {
  const ReadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final personneService = PersonneService();

    return Scaffold(
      appBar: AppBar(title: const Text("Listes d'utilisateurs")),
      body: FutureBuilder<List<Personne>>(
        future: personneService.getPersonnes(), // Ny getUsers() ao amin'ny UserService
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Erreur: ${snapshot.error}"));
          }

          final personnes = snapshot.data ?? [];
          if (personnes.isEmpty) {
            return const Center(child: Text("Auccun utilisateur"));
          }

          return ListView.builder(
            itemCount: personnes.length,
            itemBuilder: (context, index) {
              final personne = personnes[index];
              return ListTile(
                leading: CircleAvatar(child: Text("${personne.id ?? ''}")),
                title: Text(personne.email),
                subtitle: Text("Password: ${personne.password}"),
              );
            },
          );
        },
      ),
    );
  }
}