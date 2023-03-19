import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gradient Elevated Button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gradient Elevated Button'),
      ),
      body: Center(
        child: GradientElevatedButton(
          onPressed: () {

          },
          style: GradientElevatedButton.styleFrom(
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 166, 206, 57),
              Color.fromARGB(255, 0, 175, 173),
            ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: const Text("This is Gradient Elevated Button"),
        ),
      ),
    );
  }
}
