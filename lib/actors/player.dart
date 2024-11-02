import 'dart:async';

import 'package:flame/components.dart';
import 'package:maktub/maktub_pixel_adventure.dart';

enum PlayerState { idle, running, doubleJump, fall, hit, jump, wallJump }

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<MaktubPixelAdventure> {
  Player({position, required this.character}) : super(position: position);
  String character;

  //Animations
  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runningAnimation;
  late final SpriteAnimation doubleJumpAnimation;
  late final SpriteAnimation jumpAnimation;
  late final SpriteAnimation fallAnimation;
  late final SpriteAnimation hitAnimation;
  late final SpriteAnimation wallJumpAnimation;

  final double stepTime = 0.05;

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
  }

  void _loadAllAnimations() {
    idleAnimation = _spriteAnimation('Idle', 11);
    runningAnimation = _spriteAnimation('Run', 12);
    doubleJumpAnimation = _spriteAnimation('Double Jump', 6);
    jumpAnimation = _spriteAnimation('Jump', 1);
    hitAnimation = _spriteAnimation('Hit', 7);
    fallAnimation = _spriteAnimation('Fall', 1);
    wallJumpAnimation = _spriteAnimation('Wall Jump', 5);

    //List of all animations
    animations = {
      PlayerState.idle: idleAnimation,
      PlayerState.running: runningAnimation,
      PlayerState.doubleJump: doubleJumpAnimation,
      PlayerState.fall: fallAnimation,
      PlayerState.hit: hitAnimation,
      PlayerState.jump: jumpAnimation,
      PlayerState.wallJump: wallJumpAnimation,
    };

    //Set current animation
    current = PlayerState.idle;
  }

  SpriteAnimation _spriteAnimation(String state, int amount) {
    return SpriteAnimation.fromFrameData(
      game.images.fromCache('Main Characters/$character/$state (32x32).png'),
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: stepTime,
        textureSize: Vector2.all(32),
      ),
    );
  }
}
