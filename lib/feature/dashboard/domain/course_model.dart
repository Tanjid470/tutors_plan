class CourseModel {
  final String title;
  final String description;
  final String imageUrl;
  final String author;
  final int originalPrice;
  final int discountedPrice;
  final bool hasScholarship;
  final List<String> features;

  CourseModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.author,
    required this.originalPrice,
    required this.discountedPrice,
    required this.hasScholarship,
    required this.features,
  });
}
