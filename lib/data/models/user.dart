import 'dart:ui' as ui;

class User {
  ui.Image? image;
  String name;
  String imagePath;
  User({
    required this.name,
    required this.imagePath,
    this.image,
  });
}
