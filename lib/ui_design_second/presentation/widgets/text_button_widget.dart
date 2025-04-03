import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final bool? isUnderline;
  const TextButtonWidget({super.key, required this.text, this.isUnderline});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(foregroundColor: WidgetStateProperty.all(Colors.blue)),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
          color: Colors.blue,
          decoration: TextDecoration.underline,
          decorationColor: Colors.blueAccent,
          height: 0.5,
        ),
      ),
    );
  }
}
