import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maktub/maktub_pixel_adventure.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();
  MaktubPixelAdventure game = MaktubPixelAdventure();
  runApp(
    GameWidget(
      game: kDebugMode ? MaktubPixelAdventure() : game,
    ),
  );
}
