// ignore_for_file: must_call_super, overridden_fields

import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/pages/navigation/nav_arc.dart';
import 'package:freeflow/pages/navigation/nav_option.dart';

class NavigationScreen extends FlameGame
    with MultiTouchTapDetector, MultiTouchDragDetector, HasTappables {
  //late final DraggableSquare square;

  @override
  bool debugMode = false;

  @override
  Color backgroundColor() {
    return Colors.white;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    List<NavOption> navOptions = [
      NavOption(
        IconsAsset.MUSIC,
        size: Vector2.all(40),
      ),
      NavOption(
        IconsAsset.PHOTOS,
        size: Vector2.all(40),
      ),
      NavOption(
        IconsAsset.MUSIC,
        size: Vector2.all(40),
      ),
      NavOption(
        IconsAsset.PHOTOS,
        size: Vector2.all(40),
      ),
      NavOption(
        IconsAsset.MUSIC,
        size: Vector2.all(40),
      ),
      NavOption(
        IconsAsset.PHOTOS,
        size: Vector2.all(40),
      ),
    ];

    add(
      NavArc(
        navOptions,
        direction: ArcDirection.right,
        gameSize: size,
      ),
    );
    // add(
    //   NavArc(
    //     navOptions,
    //     direction: ArcDirection.left,
    //     gameSize: size,
    //   ),
    // );
    // add(
    //   NavOption(
    //     IconsAsset.MUSIC,
    //     size: Vector2.all(40),
    //     position: Vector2((size.x / 2) - 40 / 2, (size.y / 2) - 40 / 2),
    //   ),
    // );
  }
}
