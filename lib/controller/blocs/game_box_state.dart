part of 'game_box_bloc.dart';

class GameState extends Equatable {
  final List<String> board;
  final String currentPlayer;
  final int player1Score;
  final int player2Score;
  final String? winner;
  final bool isGameOver;

  const GameState({
    required this.board,
    required this.currentPlayer,
    required this.player1Score,
    required this.player2Score,
    required this.winner,
    required this.isGameOver,
  });

  factory GameState.initial() => const GameState(
    board: ['', '', '', '', '', '', '', '', ''],
    currentPlayer: 'X',
    player1Score: 0,
    player2Score: 0,
    winner: null,
    isGameOver: false,
  );

  GameState copyWith({
    List<String>? board,
    String? currentPlayer,
    int? player1Score,
    int? player2Score,
    String? winner,
    bool? isGameOver,
  }) => GameState(
    board: board ?? this.board,
    currentPlayer: currentPlayer ?? this.currentPlayer,
    player1Score: player1Score ?? this.player1Score,
    player2Score: player2Score ?? this.player2Score,
    winner: winner,
    isGameOver: isGameOver ?? this.isGameOver,
  );

  @override
  List<Object?> get props => [
    board,
    currentPlayer,
    player1Score,
    player2Score,
    winner,
    isGameOver,
  ];
}
