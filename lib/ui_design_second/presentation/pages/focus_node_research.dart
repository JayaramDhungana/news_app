import 'package:flutter/material.dart';

class FocusNodeResearch extends StatefulWidget {
  const FocusNodeResearch({super.key});

  @override
  State<FocusNodeResearch> createState() => _FocusNodeResearchState();
}

class _FocusNodeResearchState extends State<FocusNodeResearch> {
  //focus Node Initialize gareko
  late FocusNode focusNode1;
  late FocusNode focusNode2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //focus node create gareko
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FocusNode ')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              focusNode: focusNode1,
              decoration: InputDecoration(labelText: 'Field 1'),
            ),
            TextField(
              focusNode: focusNode2,
              decoration: InputDecoration(labelText: 'Field 2'),
            ),
            ElevatedButton(
              onPressed: () {
                // Focus change example
                focusNode1.requestFocus(); // Focus Field 1
              },
              child: Text('Focus Field 1'),
            ),
            ElevatedButton(
              onPressed: () {
                // Unfocus example
                focusNode1.unfocus(); // Unfocus Field 1
              },
              child: Text('Unfocus Field 1'),
            ),
          ],
        ),
      ),
    );
  }
}
