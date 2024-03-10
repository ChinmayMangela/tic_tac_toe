import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe_application/pages/start_screen.dart';

void main() {
  runApp(
    const TicTacToeMaterialPage(),
  );
}


class TicTacToeMaterialPage extends StatelessWidget {
  const TicTacToeMaterialPage({super.key});
  @override
  Widget build(context) {
    return ScreenUtilInit(
      builder: (BuildContext context, child) {
        return const MaterialApp(
          home: StartScreen(),
        );
      },
    );
  }
}