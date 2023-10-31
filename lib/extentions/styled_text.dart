import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class StyledText extends StatelessWidget {
  StyledText({super.key, required this.text});

  StyledText.title({super.key, required this.text}) : colors = Colors.white, fontWeight = FontWeight.bold, fontSize = 20;
  StyledText.normal({super.key, required this.text}) : colors = Colors.white, fontWeight = FontWeight.normal, fontSize = 16;

  String text;
  Color? colors = Colors.white;
  FontWeight? fontWeight = FontWeight.bold;
  double? fontSize = 20;

  @override
  Widget build(context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.notoSans (
        color: colors,
        fontSize: fontSize,
        fontWeight: fontWeight
      ),
    );
  }
}