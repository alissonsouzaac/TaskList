import 'package:flutter/material.dart';

class FormScrenPage extends StatefulWidget {
  const FormScrenPage({super.key});

  @override
  State<FormScrenPage> createState() => _FormScrenPageState();
}

class _FormScrenPageState extends State<FormScrenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormScrenPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FormScrenPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
