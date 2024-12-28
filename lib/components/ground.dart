// import 'package:flame/collisions.dart';
// import 'package:flame/components.dart';
// import 'package:flame/flame.dart';
// import 'package:flame/parallax.dart';
//
//
// import '../game/assets.dart';
// import '../game/configuration.dart';
//
// class Ground extends ParallaxComponent with HasGameRef {
//   Ground();
//
//   @override
//   Future<void> onLoad() async{
//     final ground = await Flame.images.load(Assets.ground);
//     parallax = Parallax([
//       ParallaxLayer(
//         ParallaxImage(ground, fill: LayerFill.none),
//       ),
//     ]);
//     add(RectangleHitbox(
//       position: Vector2(0, gameRef.size.y - Config.groundHeight),
//       size: Vector2(gameRef.size.x, Config.groundHeight),
//     ),);
//   }
//   @override
//   void update(double dt) {
//     super.update(dt);
//     parallax?.baseVelocity.x = Config.gameSpeed;
//   }
// }

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flame/input.dart'; // Import for handling input
import 'package:flutter/painting.dart'; // For handling color

import '../game/assets.dart';
import '../game/configuration.dart';

// Define your game class (MyGame) extending FlameGame
class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    // Initialize other game elements here
  }
}

class Ground extends ParallaxComponent with HasGameRef {
  Ground();

  late final ButtonComponent button1;
  late final ButtonComponent button2;
  late final ButtonComponent button3;

  @override
  Future<void> onLoad() async {
    // Load the ground image
    final ground = await Flame.images.load(Assets.ground);
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(ground, fill: LayerFill.none),
      ),
    ]);

    // Add the ground hitbox to detect interactions
    add(RectangleHitbox(
      position: Vector2(0, gameRef.size.y - Config.groundHeight),
      size: Vector2(gameRef.size.x, Config.groundHeight),
    ));
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Move the parallax background
    parallax?.baseVelocity.x = Config.gameSpeed;
  }
}
