import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final dynamic response;

  const HomeScreen({super.key, this.response});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(response.toString()),
      ),
    );
  }
}
