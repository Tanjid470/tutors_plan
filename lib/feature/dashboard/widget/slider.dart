import 'dart:ui';

class Slider {
  final String title;
  final String description;
  final String iconText;
  final Color color;
  final VoidCallback onTap;

  Slider({
    required this.title,
    required this.description,
    required this.iconText,
    required this.color,
    required this.onTap,
  });
}
