import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_application/pages/home_screen.dart';
import 'package:tic_tac_toe_application/widgets/button.dart';
import 'package:tic_tac_toe_application/widgets/text_field.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final _firstPlayerController = TextEditingController();
  final _secondPlayerController = TextEditingController();

  @override
  void dispose() {
    _firstPlayerController.dispose();
    _secondPlayerController.dispose();
    super.dispose();
  }

  Future _showDialog(String message) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ok'),
              ),
            ],
          );
        });
  }

  void _startGame() {
    String playerOneName = _firstPlayerController.text;
    String playerTwoName = _secondPlayerController.text;
    if (playerOneName.isEmpty || playerTwoName.isEmpty) {
      _showDialog('Enter both players name');
      return;
    }
    if(playerOneName.length > 10 || playerTwoName.length > 10) {
      _showDialog('Length of names should be lesser than 10 characters');
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          firstPlayerName: _firstPlayerController.text,
          secondPlayerName: _secondPlayerController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 24, 56),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter Player Names',
                style: GoogleFonts.lato(
                  color: Colors.grey.shade200,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 49.6.h),
              MyTextField(
                controller: _firstPlayerController,
                prefixText: 'X',
                hintText: 'Player One',
                color: Colors.red,
              ),
              SizedBox(height: 20.h),
              MyTextField(
                controller: _secondPlayerController,
                prefixText: 'O',
                hintText: 'Player Two',
                color: Colors.yellow,
              ),
              SizedBox(height: 34.h),
              Button(
                label: 'START GAME',
                onTap: () {
                  _startGame();
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
