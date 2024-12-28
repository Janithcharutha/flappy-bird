// import 'dart:async';
// import 'package:flame/components.dart';
// import 'package:flame/events.dart';
// import 'package:flame/game.dart';
// import 'package:game/components/background.dart';
// import 'package:game/components/ground.dart';
// import 'package:game/components/pipe_group.dart';
//
// import '../components/bird.dart';
// import 'configuration.dart';
//
// class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection{
//   late Bird bird;
//   late TextComponent score;
//   late Timer interval;
//   bool isHit = false;
//
//   FlappyBirdGame();
//
//   @override
//   Future<void> onLoad() async {
//     addAll([
//       Background(),
//       Ground(),
//       bird = Bird(),
//       score = buildScore(),
//     ]);
//
//     // Ensure Config.pipeInterval is converted to an integer
//     interval = Timer.periodic(
//         Duration(seconds: Config.pipeInterval.toInt()), // Convert to int here
//             (timer) {
//           add(PipeGroup()); // Add a new PipeGroup at the interval
//         }
//     );
//   }
//
//   @override
//   void update(double dt) {
//     super.update(dt);
//   }
//
//   TextComponent buildScore(){
//     return TextComponent(text: 'Score:0',
//         position: Vector2(size.x/2, size.y/2*0.2),
//     );
//   }
//
//   void onTap(){
//     super.onTap();
//     bird.fly();
//   }
//
//   @override
//   void onRemove() {
//     super.onRemove();
//     interval.cancel();
//   }
// }

import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:game_3/components/background.dart';
import 'package:game_3/components/ground.dart';
import 'package:game_3/components/pipe_group.dart';

import '../components/bird.dart';
import 'configuration.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  late TextComponent score;
  late Timer interval;
  bool isHit = false;

  FlappyBirdGame();

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore(),
    ]);

    // Check if Config.pipeInterval is a Duration or a double
    double intervalInSeconds;
    if (Config.pipeInterval is Duration) {
      intervalInSeconds = (Config.pipeInterval as Duration).inSeconds.toDouble();
    } else if (Config.pipeInterval is double) {
      intervalInSeconds = Config.pipeInterval;
    } else {
      throw Exception('Config.pipeInterval must be a Duration or a double');
    }

    // Create the Timer with the interval
    interval = Timer(
      intervalInSeconds, // The interval is now a double value (seconds)
      onTick: _onIntervalTick, // Callback when the timer ticks
      repeat: true, // Repeat the timer
    );
    interval.start(); // Start the timer
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt); // Update the timer
    score.text='Score:${bird.score}';
  }

  TextComponent buildScore() {
    return TextComponent(
      text: 'Score:0',
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
    );
  }

  void onTap() {
    super.onTap();
    bird.fly();
  }

  void _onIntervalTick() {
    add(PipeGroup()); // Add a new PipeGroup every interval
  }

  @override
  void onRemove() {
    super.onRemove();
    interval.stop(); // Stop the timer when the game is removed
  }
}
