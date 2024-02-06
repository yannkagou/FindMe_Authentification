import 'package:flutter/material.dart';

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
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

  // Individual keys
  Widget _buildButton(String text, {VoidCallback? onPressed}) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed ?? () => _input(text),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ),
    );
  }

  void _input(String text) {
    final value = _controller.text + text;
    setState(() {
      _controller.text = value;
    });
  }

  void _backspace() {
    final value = _controller.text;
    if (value.isNotEmpty) {
      setState(() {
        _controller.text = value.substring(0, value.length - 1);
      });
    }
  }
}
