import 'package:flutter/material.dart';

class GradientBoxWidget extends StatelessWidget {
  const GradientBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 21, 57, 75),
              Color.fromARGB(255, 38, 113, 108),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.6, 1]),
      ),
    );
  }
}
