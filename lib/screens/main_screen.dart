import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final String username;
  const MainScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${username} <- Entered with this",
          style: const TextStyle(fontSize: 16),
        ),
      ),
      body: Stack(
        children: [
          Container(),
        ],
      ),
    );
  }
}
