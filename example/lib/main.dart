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
      debugShowCheckedModeBanner: false,
      title: 'Gradient Elevated Button',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: const ColorScheme.light(
              primary: Color.fromARGB(255, 166, 206, 57),
              secondary: Color.fromARGB(255, 0, 175, 173)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: GradientElevatedButton.styleFrom(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 227, 17, 60),
                Color.fromARGB(255, 0, 175, 173),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            foregroundColor: Colors.red,
            side: const BorderSide(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          ))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientElevatedButton(
              onPressed: () {
                // 255, 166, 206, 57
              },
              style: GradientElevatedButton.styleFrom(
                gradient: const LinearGradient(
                  colors: [
                    Colors.red,
                    Colors.green,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              ),
              child:
                  const Text("This is Gradient Elevated Button style from UI"),
            ),
            const SizedBox(
              height: 50,
            ),
            GradientElevatedButton(
              onPressed: () {},
              child: const Text("This is Gradient Elevated Button From Theme"),
            ),
          ],
        ),
      ),
    );
  }
}
