import 'package:flutter/material.dart';

class PlayerLabel extends StatelessWidget {
  final String playerChar;
  final int score;
  final String userName;
  final bool isCurrentPlayer;

  const PlayerLabel({
    super.key,
    required this.playerChar,
    required this.score,
    required this.userName,
    required this.isCurrentPlayer,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.deepPurple.shade100,
          radius: 23,
          child: Text(
            playerChar,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
            Text(
              'Score: $score',
              style: const TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ],
        ),
      ],
    );
  }
}

class PlayerTurnIndicator extends StatelessWidget {
  final String currentPlayer;

  const PlayerTurnIndicator({super.key, required this.currentPlayer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'User ${currentPlayer == 'X' ? '1' : '2'}\'s turn',
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
          Text(
            currentPlayer,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
