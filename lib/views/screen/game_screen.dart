import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/controller/blocs/game_box_bloc.dart';
import 'package:tic_tac_toe/controller/blocs/game_box_event.dart';
import '../widgets/player_label.dart';
import '../widgets/showDialog.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {
            context.read<GameBloc>().add(NewRound());
          },
        ),
        title: const Text(
          'Tic Tac Toe',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black87),
            onPressed: () {
              context.read<GameBloc>().add(NewRound());
            },
          ),
        ],
      ),
      body: BlocConsumer<GameBloc, GameState>(
        listener: (context, state) {
          if (state.isGameOver && state.winner != null) {
            showDialog(
              context: context,
              builder: (dialogContext) {
                return BlocProvider.value(
                  value: context.read<GameBloc>(),
                  child: WinDialog(winner: state.winner!),
                );
              },
            );
          }
        },

        builder: (context, state) {
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PlayerLabel(
                      playerChar: 'X',
                      score: state.player1Score,
                      userName: 'User 1',
                      isCurrentPlayer: state.currentPlayer == 'X',
                    ),
                    PlayerTurnIndicator(currentPlayer: state.currentPlayer),
                    PlayerLabel(
                      playerChar: 'O',
                      score: state.player2Score,
                      userName: 'User 2',
                      isCurrentPlayer: state.currentPlayer == 'X',
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 10),
              Expanded(
                child: Center(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                    itemCount: 9,
                    padding: const EdgeInsets.all(20.0),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.read<GameBloc>().add(MakeMove(index));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              state.board[index],
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color:
                                    state.board[index] == 'X'
                                        ? Colors.deepPurple
                                        : Colors.red,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF0F0F5),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            context.read<GameBloc>().add(NewRound());
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            foregroundColor: Colors.black87,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          icon: const Icon(Icons.refresh, size: 20),
                          label: const Text(
                            "New Round",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF0F0F5),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            context.read<GameBloc>().add(SwapStarter());
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            foregroundColor: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          icon: const Icon(Icons.swap_horiz, size: 20),
                          label: const Text(
                            "Swap Starter",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
