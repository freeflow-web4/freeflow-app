import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:freeflow/core/utils/image_utils.dart';
import 'package:freeflow/pages/navigation/navigation.dart';
import 'package:flutter/material.dart' hide Image, Draggable;
import 'package:flame_svg/flame_svg.dart';
import 'dart:ui' as ui;

class NavOption extends PositionComponent
    with HasGameRef<NavigationScreen>, Tappable {
  bool visible = false;
  final String imageAssetPath;

  late Svg svgInstance;
  late SvgComponent svgComponent;
  late Sprite sprite;
  late Image imageFromNetwork;
  double iconWidth = 0;

  NavOption(this.imageAssetPath, {Vector2? size, Vector2? position})
      : super(
          size: size ?? Vector2.all(32),
          position: position ?? Vector2.all(0),
        );

  bool get isSvg => imageAssetPath.contains(".svg");
  bool get isNetworkImage =>
      imageAssetPath.contains("http://") || imageAssetPath.contains("https://");

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    iconWidth = size.x * 0.7;
    if (isSvg) {
      svgInstance = await Svg.load(imageAssetPath);
      svgComponent = SvgComponent.fromSvg(
        svgInstance,
        size: Vector2.all(iconWidth),
      );
      svgComponent.position = Vector2(
        (size.x / 2) - (svgComponent.width / 2),
        (size.y / 2) - (svgComponent.height / 2),
      );
    } else if (!isNetworkImage) {
      sprite = await gameRef.loadSprite(
        imageAssetPath,
        srcSize: Vector2.all(iconWidth),
      );
      sprite.srcPosition = Vector2(
        (size.x / 2) - (sprite.image.width / 2),
        (size.y / 2) - (sprite.image.height / 2),
      );
    } else {
      imageFromNetwork = await ImageUtils.loadAndResizeImage(
        imageAssetPath,
        width: iconWidth.toInt(),
      );
      sprite = Sprite(
        imageFromNetwork,
      );
      sprite.srcPosition = Vector2(
        (size.x / 2) - (sprite.image.width / 2),
        (size.y / 2) - (sprite.image.height / 2),
      );
    }
    position = Vector2(position.x - (size.x / 2), position.y - (size.y / 2));
  }

  @override
  void render(Canvas canvas) async {
    canvas.save();
    final rect = Rect.fromLTWH(
      0,
      0,
      size.x,
      size.y,
    );
    Path path = Path()..addOval(rect);

    canvas.clipPath(path);

    final circlePaint = Paint()
      ..shader = ui.Gradient.linear(
        rect.topLeft,
        rect.topRight,
        [
          const Color(0xff2AB7BB),
          const Color(0xffc4dede),
        ],
      );

    canvas.drawCircle(
      Offset(
        size.x * 0.8,
        (size.y / 2),
      ),
      size.x,
      //Paint()..color = const Color(0xff2AB7BB),
      circlePaint,
    );

    if (isSvg) {
      svgInstance.renderPosition(
        canvas,
        svgComponent.position,
        svgComponent.size,
      );
    } else {
      canvas.drawImage(
        sprite.image,
        Offset(sprite.srcPosition.x, sprite.srcPosition.y),
        Paint(),
      );
    }
    canvas.restore();
  }
}
