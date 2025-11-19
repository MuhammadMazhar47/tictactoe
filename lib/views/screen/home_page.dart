import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/start_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeStart homeStart = context.read<HomeStart>();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F9),
      body: BlocListener<HomeStart, HomeState>(
        listener: (context, state) {},
        child: Column(
          children: <Widget>[
            const Spacer(flex: 3),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'TIC TAC TOE',
                    style: TextStyle(
                      fontSize: 32,
                      // fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      // color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Play with a friend • Local multiplayer',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 170,
                    child: ElevatedButton(
                      onPressed: () {
                        homeStart.startGame(context);
                        print('start game------>>>>>${homeStart}');
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.deepPurpleAccent,
                        backgroundColor: Color(0xFFF5F5F9),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.play_arrow, color: Colors.deepPurple),
                          SizedBox(width: 8),
                          Text(
                            'Start Game',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(flex: 3),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: const Text(
                'Have fun – make your move!',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
