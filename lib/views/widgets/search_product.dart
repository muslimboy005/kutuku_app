import 'package:flutter/material.dart';

class SearchProduct extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String label;
  final Color labelColor;

  const SearchProduct(
      this.image, this.title, this.subtitle, this.label, this.labelColor,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
            height: 100,
            width: 100,
            child:
                Image.network(image, width: 50, height: 50, fit: BoxFit.cover)),
      ),
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          )),
      subtitle: Text(subtitle),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: labelColor.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(label,
            style: TextStyle(color: labelColor, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
