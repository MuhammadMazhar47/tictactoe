import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'game_box_event.dart';
part 'game_box_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameState.initial()) {
    on<MakeMove>(_onMakeMove);
    on<NewRound>(_onNewRound);
    on<SwapStarter>(_onSwapStarter);
    on<ResetScores>(_onResetScores);
  }

  void _onMakeMove(MakeMove event, Emitter<GameState> emit) {
    if (state.isGameOver || state.board[event.index].isNotEmpty) return;

    final updatedBoard = List.of(state.board);
    updatedBoard[event.index] = state.currentPlayer;

    final winner = _checkWinner(updatedBoard);

    if (winner != null) {
      emit(
        state.copyWith(
          board: updatedBoard,
          winner: winner,
          isGameOver: true,
          player1Score:
              winner == 'X' ? state.player1Score + 1 : state.player1Score,
          player2Score:
              winner == 'O' ? state.player2Score + 1 : state.player2Score,
        ),
      );
    } else if (_isFull(updatedBoard)) {
      emit(
        state.copyWith(board: updatedBoard, winner: "Draw", isGameOver: true),
      );
    } else {
      emit(
        state.copyWith(
          board: updatedBoard,
          currentPlayer: state.currentPlayer == 'X' ? 'O' : 'X',
        ),
      );
    }
  }

  void _onNewRound(NewRound event, Emitter<GameState> emit) {
    emit(
      GameState.initial().copyWith(
        player1Score: state.player1Score,
        player2Score: state.player2Score,
      ),
    );
  }

  void _onSwapStarter(SwapStarter event, Emitter<GameState> emit) {
    emit(
      GameState.initial().copyWith(
        player1Score: state.player1Score,
        player2Score: state.player2Score,
        currentPlayer: state.currentPlayer == 'X' ? 'O' : 'X',
      ),
    );
  }

  void _onResetScores(ResetScores event, Emitter<GameState> emit) {
    emit(GameState.initial());
  }

  String? _checkWinner(List<String> b) {
    final wins = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var p in wins) {
      if (b[p[0]].isNotEmpty && b[p[0]] == b[p[1]] && b[p[1]] == b[p[2]]) {
        return b[p[0]];
      }
    }
    return null;
  }

  bool _isFull(List<String> board) => board.every((e) => e.isNotEmpty);
}
