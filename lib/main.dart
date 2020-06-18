import 'package:flutter/cupertino.dart';
import 'package:startup_name_app/randomword.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "Startup Name Generator",
      home: RandomWords(),
    );
  }
}