import 'package:flutter/material.dart';

class CanceladoPage extends StatefulWidget {
  const CanceladoPage({super.key});

  @override
  State<CanceladoPage> createState() => _CanceladoPageState();
}

class _CanceladoPageState extends State<CanceladoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text("Se cancelo")),
    );
  }
}
