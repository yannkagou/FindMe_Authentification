import 'package:findme_test/screens/welcomeScreen.dart';
import 'package:flutter/material.dart';

//Ce widget permettra d'avoir un clavier numerique personnalisé pour la saisie du code Pin. Il prendra donc en paramètre un TextEditingController

class NumericKeypad extends StatefulWidget {
  final TextEditingController controller;

  const NumericKeypad({Key? key, required this.controller}) : super(key: key);

  @override
  State<NumericKeypad> createState() => _NumericKeypadState();
}

class _NumericKeypadState extends State<NumericKeypad> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  //Montage du clavier personnalisé
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              _buildButton(''),
              _buildButton('0'),
              Expanded(
                child: IconButton(
                    iconSize: 24,
                    icon: const Icon(
                      Icons.backspace,
                    ),
                    onPressed: _backspace),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Montage de chacun des bouttons avec le chiffre et la fonction en de saisie en paramètre
  Widget _buildButton(String text, {VoidCallback? onPressed}) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed ?? () => _input(text),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  // La fonction de remplissage des champs de texte pour passer à la page suivante
  void _input(String text) {
    final value = _controller.text + text;
    setState(() {
      _controller.text = value;
      if (_controller.text.length == 4) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        );
      }
    });
  }

  // La fonction de suppression de champs de texte
  void _backspace() {
    final value = _controller.text;
    if (value.isNotEmpty) {
      setState(() {
        _controller.text = value.substring(0, value.length - 1);
      });
    }
  }
}
