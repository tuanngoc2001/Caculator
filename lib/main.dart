import 'package:caculator/asstes.dart';
import 'package:caculator/screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Caculator(),
  ));
}

class Caculator extends StatefulWidget {
  const Caculator({Key? key}) : super(key: key);

  @override
  _CaculatorState createState() => _CaculatorState();
}

class _CaculatorState extends State<Caculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: const Screen(),
    );
  }
}
