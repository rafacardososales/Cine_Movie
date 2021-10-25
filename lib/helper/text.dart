import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class EditText extends StatelessWidget {

  final String? text;
  final Color? color;
  final double? size;
  const EditText({Key? key, this.text, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!, style: GoogleFonts.abel(
      color: color, fontSize: size
    ),
    );
  }
}
