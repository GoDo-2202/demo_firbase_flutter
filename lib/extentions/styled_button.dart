import 'package:demo_firbase_app/extentions/styled_text.dart';
import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  StyledButton({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback? onPressed;
  final List<Color> colors = [Colors.deepOrangeAccent, Colors.pink];
  final ButtonStyle style = ButtonStyle(
    overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.transparent; //<-- SEE HERE
        } else if (states.contains(MaterialState.hovered)) {
          return Colors.transparent; //<-- SEE HERE
        }
        return Colors.transparent; // Defer to the widget's default.
      },
    ),
    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.transparent; //<-- SEE HERE
        } else if (states.contains(MaterialState.hovered)) {
          return Colors.transparent; //<-- SEE HERE
        }
        return Colors.transparent; // Defer to the widget's default.
      },
    ),
    shadowColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.transparent; //<-- SEE HERE
        } else if (states.contains(MaterialState.hovered)) {
          return Colors.transparent; //<-- SEE HERE
        }
        return Colors.transparent; // Defer to the widget's default.
      },
    ),
    padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>(
      (Set<MaterialState> states) {
        return const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ); // Defer to the widget's default.
      },
    ),
  );

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(22)),
          gradient: LinearGradient(
              colors: colors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: StyledText.normal(text: text),
      ),
    );
  }
}
