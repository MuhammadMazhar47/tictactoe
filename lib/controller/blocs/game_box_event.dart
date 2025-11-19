import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class GameBoxEvent {}

class SelectBoxEvent extends GameBoxEvent {
  final int index;
  final int currentUser;
  final BuildContext context;
  SelectBoxEvent({
    required this.index,
    required this.currentUser,
    required this.context,
  });
}

class RestGameEvent extends GameBoxEvent {}

abstract class GameEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MakeMove extends GameEvent {
  final int index;
  MakeMove(this.index);

  @override
  List<Object?> get props => [index];
}

class NewRound extends GameEvent {}

class SwapStarter extends GameEvent {}

class ResetScores extends GameEvent {}
