import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game_3/screens/game_over_screen.dart';
import 'package:game_3/screens/main_menu_screen.dart';

import 'game/flappy_Bird_game.dart';

void main() {
  final game = FlappyBirdGame();

  runApp(GameWidget(
    game: game,
    initialActiveOverlays: const[MainMenuScreen.id],
    overlayBuilderMap: {
      'mainMenu': (context, _) => MainMenuScreen(game: game),
      'gameOver': (context, _) => GameOverScreen(game: game),
    },
  ),
  );
}

