import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../component/appbar_component.dart';

class SimpleApp extends StatefulWidget {
  const SimpleApp({super.key});

  @override
  State<SimpleApp> createState() => _SimpleAppState();
}

class _SimpleAppState extends State<SimpleApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     body: AppbarComponent(appBarText: "Simple App", appBarColor: Colors.red),
    );
  }
}
