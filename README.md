
# GradientElevatedButton

[![pub package](https://img.shields.io/pub/v/like_button.svg)](https://pub.dartlang.org/packages/like_button) [![GitHub license](https://img.shields.io/github/license/fluttercandies/like_button)](https://github.com/fluttercandies/like_button/blob/master/LICENSE) 

A customizable elevated button with gradient support for your Flutter applications. This package allows you to create buttons with gradient backgrounds, custom foreground colors, and various other customizable properties using the `GradientElevatedButton` widget.

## Features

- **Gradient Background:** Easily apply gradients to your button backgrounds.
- **Customizable Style:** Customize text color, shape, padding, and more.
- **Integration with Theme:** Use `GradientButtonThemeData` to apply a consistent style across your app.


[Demo](https://github.com/ChegzDev/gradient_elevated_button/blob/master/example/lib/main.dart)


<img src="screen_shot/sample.png" alt="drawing" width="200"/>

## Installation

Add the following dependency in your `pubspec.yaml` file:

```yaml
dependencies :
  gradient_elevated_button : ^1.0.2 # Replace with the current version
```
then run:

```bash
 flutter pub get
```
**OR**
Alternatively, you can add the package by running the following command in your terminal:

```bash
 flutter pub add gradient_elevated_button
```

## Usage

### 1. Using GradientButtonThemeData

The `GradientButtonThemeData` allows you to define a consistent button style across your app. Here's how to use it:

```dart
    main() {
      return GradientButtonTheme(
        data: GradientElevatedButton.styleFrom(
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.green],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          foregroundColor: Colors.black,
        ),
        child: const MaterialApp(
          // Your app code
        ),
      );
    }
```
### 2. Using GradientElevatedButton with Theme

Once you've defined the theme, you can directly use `GradientElevatedButton` with the inherited gradient feature from `GradientButtonThemeData`.

```dart
    Widget gradientButton = GradientElevatedButton(
      onPressed: () {},
      child: const Text("This is Gradient Elevated Button From Theme"),
    );
```
### 3. Using GradientElevatedButton.styleFrom

Alternatively, you can style the `GradientElevatedButton` directly using `GradientElevatedButton.styleFrom` to define the button's gradient, shape, and other properties:

```dart    
    Widget gradientWidget = GradientElevatedButton(
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
     );
```  

## Customization
You can fully customize the GradientElevatedButton using the following properties:

- **gradient**: A `LinearGradient` (or other types) that defines the background gradient.
- **foregroundColor**: The color of the text and icon on the button.
- **backgroundColor**: (Optional) A fallback color for the button's background if no gradient is provided.
- **padding**: Padding inside the button.
- **shape**: Define the button’s shape with a `ShapeBorder` like `RoundedRectangleBorder` or `StadiumBorder`.
- **elevation**: Controls the button's elevation (default: 2).
- **onPressed**: The callback function that is called when the button is pressed.

## Example

[click here](https://github.com/ChegzDev/gradient_elevated_button/blob/master/example/lib/main.dart) for example


## Issues and feedback

Please file issues and feedback using the Github issues page for this repository.

If you have any suggestions or feedback, please send an email to __chegz.dev@gmail.com__ and we'll be happy to hear from you!
