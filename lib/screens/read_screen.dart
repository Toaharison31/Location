import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/user_service.dart';

class ReadScreen extends StatelessWidget {
  const ReadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = UserService();

    return Scaffold(
      appBar: AppBar(title: const Text("Listes d'utilisateurs")),
      body: FutureBuilder<List<User>>(
        future: userService.getUsers(), // Ny getUsers() ao amin'ny UserService
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Erreur: ${snapshot.error}"));
          }

          final users = snapshot.data ?? [];
          if (users.isEmpty) {
            return const Center(child: Text("Auccun utilisateur"));
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(child: Text("${user.id ?? ''}")),
                title: Text(user.email),
                subtitle: Text("Password: ${user.password}"),
              );
            },
          );
        },
      ),
    );
  }
}