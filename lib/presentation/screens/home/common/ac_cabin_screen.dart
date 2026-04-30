import 'package:flutter/material.dart';

class AcCabinScreen extends StatelessWidget {
  const AcCabinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AC Cabin Tractors")),
      body: const Center(child: Text("AC Cabin Tractors ki List yahan dikhegi.")),
    );
  }
}