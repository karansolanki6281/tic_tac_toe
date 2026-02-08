import 'package:flutter/material.dart';

void main() {
  runApp(const TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tic Tac Toe",
      home: const TicTacToePage(),
    );
  }
}

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({super.key});

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  List<String> board = List.filled(9, "");
  bool isXturn = true;
  String resultText = "Turn: X";
  bool gameOver = false;
  int filledBoxes = 0;

  void handleTap(int index) {
    if (board[index] != "" || gameOver) return;

    setState(() {
      board[index] = isXturn ? "X" : "O";
      isXturn = !isXturn;
      filledBoxes++;
      resultText = "Turn: ${isXturn ? "X" : "O"}";
    });

    checkWinner();
  }

  void checkWinner() {
    List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      String a = board[pattern[0]];
      String b = board[pattern[1]];
      String c = board[pattern[2]];

      if (a != "" && a == b && b == c) {
        setState(() {
          resultText = "Winner: $a 🎉";
          gameOver = true;
        });

        autoReset();
        return;
      }
    }

    // Draw condition
    if (filledBoxes == 9 && !gameOver) {
      setState(() {
        resultText = "It's a Draw 😄";
        gameOver = true;
      });

      autoReset();
    }
  }

  void autoReset() {
    Future.delayed(const Duration(seconds: 2), () {
      resetGame();
    });
  }

  void resetGame() {
    setState(() {
      board = List.filled(9, "");
      isXturn = true;
      resultText = "Turn: X";
      gameOver = false;
      filledBoxes = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Tic Tac Toe"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),

          Text(
            resultText,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => handleTap(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 6,
                          offset: const Offset(2, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        board[index],
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: board[index] == "X"
                              ? Colors.blue
                              : Colors.red,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          Text(
            gameOver ? "Resetting..." : "",
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
