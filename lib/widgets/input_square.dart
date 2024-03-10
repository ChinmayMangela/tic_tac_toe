import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InputSquare extends StatelessWidget {
  const InputSquare({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
  });

  final String text;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.all(5.6).r,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6.6).r,
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.lato(
              color: text == 'X' ? Colors.red : Colors.yellow,
              fontSize: 35.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
