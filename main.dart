import 'package:flutter/material.dart';

void main() {
  runApp(SoupOnGame());
}

class SoupOnGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soupçon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Soupçon - Menu Principal")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => TestLogique())),
              child: Text("Démarrer l'Épisode 1"),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text("Épisode 2 (verrouillé)"),
            ),
          ],
        ),
      ),
    );
  }
}

class TestLogique extends StatefulWidget {
  @override
  _TestLogiqueState createState() => _TestLogiqueState();
}

class _TestLogiqueState extends State<TestLogique> {
  String _message = "";
  void verifier(String reponse) {
    setState(() {
      if (reponse == "B") {
        _message = "✅ Bonne réponse ! Épisode 2 déverrouillé bientôt...";
      } else {
        _message = "❌ Mauvaise réponse. Réessaie.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Épisode 1 : Piège Logique")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Question : Quel est l’intrus dans cette série logique ?"),
            Text("1, 2, 4, 8, 16, 31"),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => verifier("A"), child: Text("A. 16")),
            ElevatedButton(onPressed: () => verifier("B"), child: Text("B. 31")),
            ElevatedButton(onPressed: () => verifier("C"), child: Text("C. 8")),
            SizedBox(height: 20),
            Text(_message, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
