import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/controller/blocs/game_box_bloc.dart';
import '../screen/game_screen.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeStart extends Cubit<HomeState> {
  HomeStart() : super(const HomeState());

  void startGame(BuildContext context) {
    print("Game Started----------->>>>");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (_) => BlocProvider(
              create: (context) => GameBloc(),
              child: const GameScreen(),
            ),
      ),
    );
  }
}
