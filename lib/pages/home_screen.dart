import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_application/widgets/players_info_container.dart';
import 'package:tic_tac_toe_application/widgets/button.dart';
import 'package:tic_tac_toe_application/widgets/input_square.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.firstPlayerName,
    required this.secondPlayerName,
  });

  final String firstPlayerName;
  final String secondPlayerName;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String firstPlayerName;
  late String secondPlayerName;

  @override
  void initState() {
    super.initState();
    firstPlayerName = widget.firstPlayerName;
    secondPlayerName = widget.secondPlayerName;
  }

  final List<String> displayExOh = ['', '', '', '', '', '', '', '', ''];
  final List<int> matchedIndexes = [];
  bool isX = true;
  String result = '';
  int noOfTimesXWins = 0;
  int noOfTimesOWins = 0;
  Color? color;
  int noOfGames = 0;

  void _display(int index) {
    setState(
      () {
        if (displayExOh[index] == '') {
          displayExOh[index] = isX ? 'X' : 'O';
        }

        isX = !isX;
        if (_checkWinner()) {
          isX = true;
        }
      },
    );
  }

  void _updateScore(String winner) {
    setState(() {
      if (winner == 'X') {
        noOfTimesXWins++;
      } else {
        noOfTimesOWins++;
      }
    });
  }

  bool _checkWinner() {
    List<List<int>> winningConditions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    bool isEmptyColumns = displayExOh.contains('');
    for (List<int> condition in winningConditions) {
      if (_checkWinningConditions(condition)) {
        matchedIndexes.addAll(condition);
        return true;
      }
    }

    if (!isEmptyColumns) {
      setState(() {
        result = 'Match Draw';
      });
    }
    return false;
  }

  bool _checkWinningConditions(List<int> condition) {
    int a = condition[0];
    int b = condition[1];
    int c = condition[2];

    if (displayExOh[a] == displayExOh[b] &&
        displayExOh[b] == displayExOh[c] &&
        displayExOh[a] != '') {
      setState(() {
        String playerName =
            displayExOh[a] == 'X' ? firstPlayerName : secondPlayerName;
        result = 'Winner is $playerName';
        _updateScore(displayExOh[a]);
      });
      return true;
    }
    return false;
  }

  void _reStart() {
    setState(() {
      result = '';
      displayExOh.fillRange(0, displayExOh.length, '');
      matchedIndexes.clear();
      noOfGames++;
      isX = noOfGames % 2 == 0;
    });
  }

  bool isXTurn() {
    return isX;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 24, 56),
      body: Padding(
        padding: const EdgeInsets.all(12.0).r,
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  firstPlayerInfo(),
                  secondPlayerInfo(),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return InputSquare(
                    text: displayExOh[index],
                    color: matchedIndexes.contains(index)
                        ? Colors.grey.shade200
                        : const Color.fromARGB(255, 1, 12, 40),
                    onTap: () {
                      !_checkWinner() ? _display(index) : null;
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    result,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 20.6.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Button(
                    label: 'RESTART',
                    onTap: () {
                      _reStart();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PlayerInfoContainer firstPlayerInfo() {
    return PlayerInfoContainer(
      playerName: firstPlayerName,
      isX: true,
      noOfTimesPlayerWin: noOfTimesXWins,
      border: isXTurn()
          ? Border.all(
              color: Colors.white,
            )
          : Border.all(),

    );
  }

  PlayerInfoContainer secondPlayerInfo() {
    return PlayerInfoContainer(
      playerName: secondPlayerName,
      isX: false,
      noOfTimesPlayerWin: noOfTimesOWins,
      border: !isXTurn()
          ? Border.all(
              color: Colors.white,
            )
          : Border.all(),

    );
  }
}
