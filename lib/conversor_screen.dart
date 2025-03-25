import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: use_key_in_widget_constructors
class ConversorScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ConversorScreenState createState() => _ConversorScreenState();
}

class _ConversorScreenState extends State<ConversorScreen> {
  // ignore: prefer_final_fields
  TextEditingController _controller = TextEditingController();
  String _resultado = '';
  String _ultimaConversao = '';

  @override
  void initState() {
    super.initState();
    _loadUltimaConversao();
  }

  _loadUltimaConversao() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _ultimaConversao =
          prefs.getString('ultimaConversao') ?? 'Nenhuma conversão anterior';
    });
  }

  _saveUltimaConversao(String conversao) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('ultimaConversao', conversao);
  }

  void _converter() {
    if (_controller.text.isNotEmpty) {
      double metros = double.parse(_controller.text);
      double km = metros / 1000;
      String resultado = '$metros metros são $km quilômetros';

      setState(() {
        _resultado = resultado;
      });

      _saveUltimaConversao(resultado);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Conversor de Metros para Km'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                labelText: 'Digite em Metros',
                // ignore: prefer_const_constructors
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            // ignore: prefer_const_constructors
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _converter,
              // ignore: prefer_const_constructors
              child: Text('Converter'),
            ),
            // ignore: prefer_const_constructors
            SizedBox(height: 20),
            Text(
              _resultado,
              // ignore: prefer_const_constructors
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // ignore: prefer_const_constructors
            SizedBox(height: 40),
            // ignore: prefer_const_constructors
            Text(
              'Última Conversão:',
              // ignore: prefer_const_constructors
              style: TextStyle(fontSize: 18),
            ),
            Text(
              _ultimaConversao,
              // ignore: prefer_const_constructors
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
