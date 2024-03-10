import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.prefixText,
    required this.hintText,
    required this.color, required this.controller,
  });

  final String prefixText;
  final String hintText;
  final Color color;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 1, 12, 40),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                prefixText,
                style: GoogleFonts.lato(
                  color: prefixText == 'X' ? Colors.red : Colors.yellow,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: TextField(
                controller: controller,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: GoogleFonts.lato(
                      color: const Color.fromARGB(160, 255, 255, 255),
                      fontSize: 20.sp,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
