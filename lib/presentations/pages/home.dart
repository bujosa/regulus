import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Signed as ${user.email!}',
                overflow: TextOverflow.fade,
                maxLines: 3,
                style: const TextStyle(fontSize: 20)),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () => FirebaseAuth.instance.signOut(),
              child: const Center(
                  child: Text('Logout',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))),
            )
          ],
        ),
      ),
    );
  }
}
