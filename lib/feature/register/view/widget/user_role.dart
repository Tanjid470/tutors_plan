import 'dart:ui';

class UserRole {
  final String title;
  final String imageUrl;
  final Color selectedColor;
  final Color bgColor;
  int? id;

  UserRole({
    required this.title,
    required this.imageUrl,
    required this.selectedColor,
    required this.bgColor,
    this.id,
  });

  UserRole copyWith({
    String? title,
    String? imageUrl,
    Color? selectedColor,
    Color? bgColor,
    int? id,
  }) {
    return UserRole(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      selectedColor: selectedColor ?? this.selectedColor,
      bgColor: bgColor ?? this.bgColor,
      id: id ?? this.id,
    );
  }
}
