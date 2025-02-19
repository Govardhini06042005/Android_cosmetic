import 'package:flutter/material.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offers'),
      ),
      body: const Center(
        child: Text(
          'Here are the offers.',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
