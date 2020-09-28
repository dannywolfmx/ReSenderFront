// Flutter code sample for Form

// This example shows a [Form] with one [TextFormField] to enter an email
// address and a [RaisedButton] to submit the form. A [GlobalKey] is used here
// to identify the [Form] and validate input.
//
// ![](https://flutter.github.io/assets-for-api-docs/assets/widgets/form.png)

import 'package:flutter/material.dart';
import 'package:myapp/contants.dart';
import 'package:myapp/routs.dart';
import 'package:myapp/screens/sign_in/sign_in_screen.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: theme(),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
      ),
      initialRoute: SignInScreen.routeName,
      routes: routes,
    );
  }
}

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Color(0xFF8B8B8B),
          fontSize: 18,
        ),
      ),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: kTextColor,
      ),
      bodyText2: TextStyle(
        color: kTextColor,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
