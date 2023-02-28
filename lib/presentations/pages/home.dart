import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: const <Widget>[
            Text('You are login',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
