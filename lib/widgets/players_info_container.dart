import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerInfoContainer extends StatelessWidget {
  const PlayerInfoContainer({
    super.key,
    required this.playerName,
    required this.isX,
    required this.noOfTimesPlayerWin,
    required this.border,
  });

  final String playerName;
  final bool isX;
  final int noOfTimesPlayerWin;
  final Border border;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 150.w,
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 1, 12, 40),
          border: border,
        ),
        child: Center(
          child: Column(
            children: [
              _buildText(playerName, Colors.white, 20.sp),
              _buildText(
                isX ? 'X' : 'O',
                isX ? Colors.red : Colors.yellow,
                30.sp,
              ),
              _buildText(noOfTimesPlayerWin.toString(), Colors.white, 23.sp)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(String text, Color color, double fontSize) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
