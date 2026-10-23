import 'package:flutter/material.dart';
import 'database_service.dart';

// ignore: use_key_in_widget_constructors
class FirebaseScreen extends StatelessWidget {
  final DatabaseService db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBar(title: Text("Firebase Realtime Database")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => db.salvarDados("1", "João", "joao@email.com"),
              // ignore: prefer_const_constructors
              child: Text("Salvar Dados"),
            ),
            ElevatedButton(
              onPressed: () => db.lerDados("1"),
              // ignore: prefer_const_constructors
              child: Text("Ler Dados"),
            ),
            ElevatedButton(
              onPressed: () => db.escutarMudancas(),
              // ignore: prefer_const_constructors
              child: Text("Escutar Mudanças"),
            ),
          ],
        ),
      ),
    );
  }
}
