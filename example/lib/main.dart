import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
import 'package:gradient_elevated_button/inherited/gradient_elevated_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    /// Setup GradientButtonThemeData for simplify the code
    return GradientButtonThemeData(
      data: GradientElevatedButton.styleFrom(
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.green],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        foregroundColor: Colors.black,
      ),
      child: MaterialApp(
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
      ),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            const SizedBox(
              height: 50,
            ),
            Sample(
              title: "USE `GradientElevatedButton.styleFrom`",
              child: GradientElevatedButton(
                onPressed: () {

                },
                style: GradientElevatedButton.styleFrom(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF00B894),
                      Color(0xFF6C5CE7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                  const EdgeInsets.symmetric(vertical: 20 , horizontal: 10),
                ),
                child: const Text("This is Gradient Elevated Button style from UI"),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Sample(
              title: "USE from `GradientButtonThemeData`",
              child: GradientElevatedButton(
                onPressed: () {},
                child: const Text("This is Gradient Elevated Button From Theme"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class Sample extends StatelessWidget {
  final String title;
  final Widget child;
  const Sample({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(title,
              style: TextTheme.of(context).titleMedium,),
          ),
          SizedBox(height: 10,),
          child,
        ],
      ),
    );
  }
}
