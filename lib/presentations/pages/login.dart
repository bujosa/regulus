import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    // Text Field controllers
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    Future signIn() async {
      print(
          'email: ${emailController.text} and password: ${passwordController.text}');

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 150, bottom: 150),
                child: Text('LOG IN',
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.only(left: 10, top: 5),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: TextField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Username',
                      hintStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: !_passwordVisible,
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: InputBorder.none,
                      hintStyle: const TextStyle(color: Colors.black),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.only(left: 10),
                height: 60,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 29, 71, 122),
                ),
                child: GestureDetector(
                  onTap: signIn,
                  child: const Center(
                      child: Text('Sign in',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                    children: [
                      TextSpan(
                          text: 'Sign up',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 29, 71, 122),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = () => {}),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
