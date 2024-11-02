import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/painting.dart';
import 'package:maktub/actors/player.dart';
import 'package:maktub/levels/level.dart';

class MaktubPixelAdventure extends FlameGame
    with HasKeyboardHandlerComponents, DragCallbacks {
  @override
  Color backgroundColor() => const Color(0xFF211F30);
  late final CameraComponent cam;
  late JoystickComponent joystick;
  Player player = Player(character: "Mask Dude");

  @override
  FutureOr<void> onLoad() async {
    //Load all images into cache
    await images.loadAllImages();
    final world = Level(levelName: 'Level-02', player: player);
    cam = CameraComponent.withFixedResolution(
        world: world, width: 640, height: 360);
    cam.viewfinder.anchor = Anchor.topLeft;
    cam.priority = 1000;
    addAll([cam, world]);
    addJoystick();
    return super.onLoad();
  }

  void addJoystick() {
    joystick = JoystickComponent(
      knob: SpriteComponent(
        sprite: Sprite(
          images.fromCache('HUD/Knob.png'),
        ),
      ),
      background: SpriteComponent(
        sprite: Sprite(
          images.fromCache('HUD/Joystick.png'),
        ),
      ),
      margin: const EdgeInsets.only(left: 50, bottom: 50),
    );

    joystick.priority = 1001;
    add(joystick);
  }
}
