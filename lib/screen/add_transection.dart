import 'package:flutter/material.dart';

class AddtransectionScreen extends StatefulWidget {
  const AddtransectionScreen({super.key});

  @override
  State<AddtransectionScreen> createState() => _AddtransectionScreenState();
}

class _AddtransectionScreenState extends State<AddtransectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Aggiungi transazione",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(children: [Text("category")]),
    );
  }
}
