import 'package:flutter/material.dart';
import 'authorization.dart';


void main() {
  runApp(const instagram());
}

class instagram extends StatelessWidget {
  const instagram({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authorization(),
    );
  }
}