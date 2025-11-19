import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/blocs/game_box_bloc.dart';
import '../../controller/blocs/game_box_event.dart';

class WinDialog extends StatelessWidget {
  final String winner;

  const WinDialog({super.key, required this.winner});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "User ${winner == 'X' ? '1' : '2'} wins!",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Text("🎉 $winner wins", style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    context.read<GameBloc>().add(ResetScores());
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Reset Scores",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF0F0F5),
                    shadowColor: Colors.black26,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                  onPressed: () {
                    context.read<GameBloc>().add(NewRound());
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Play Again",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
