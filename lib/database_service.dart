import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  // Escrever dados no banco
  Future<void> salvarDados(String id, String nome, String email) async {
    await _database.child("usuarios/$id").set({
      "id": id,
      "nome": nome,
      "email": email
    });
  }

  // Ler dados uma vez
  Future<void> lerDados(String id) async {
    DatabaseEvent event = await _database.child("usuarios/$id").once();
    // ignore: avoid_print
    print(event.snapshot.value);
  }

  // Escutar mudanças em tempo real
  void escutarMudancas() {
    _database.child("usuarios").onValue.listen((event) {
      // ignore: avoid_print
      print("Dados atualizados: ${event.snapshot.value}");
    });
  }
}
