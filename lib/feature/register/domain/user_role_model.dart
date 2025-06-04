import 'dart:ui';

class UserRoleModel {
  final String title;
  final String imageUrl;
  final Color selectedColor;
  final Color bgColor;
  final String? id;

  UserRoleModel({
    required this.title,
    required this.imageUrl,
    required this.selectedColor,
    required this.bgColor,
    this.id,
  });

  UserRoleModel copyWith({
    String? title,
    String? imageUrl,
    Color? selectedColor,
    Color? bgColor,
    String? id,
  }) {
    return UserRoleModel(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      selectedColor: selectedColor ?? this.selectedColor,
      bgColor: bgColor ?? this.bgColor,
      id: id ?? this.id,
    );
  }
}
