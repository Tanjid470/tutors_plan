import 'package:flutter/material.dart';
import 'package:tutors_plan/config/font_constants.dart';

class BulletPointCard extends StatelessWidget {
  final List<Map<String, String>> items;
  final Color borderColor;

  const BulletPointCard({
    super.key,
    required this.items,
    this.borderColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("● ", style: TextStyle(color: Colors.green)),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5),
                    children: [
                      TextSpan(text: "${item['title']}: ", style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: item['description']),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
