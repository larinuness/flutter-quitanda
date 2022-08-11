import 'package:flutter/material.dart';

class CustomCategoryTile extends StatelessWidget {
  const CustomCategoryTile({
    Key? key,
    required this.category,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(6.5),
          decoration: BoxDecoration(
            color: isSelected ? Colors.green : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            textAlign: TextAlign.center,
            category,
            style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : const Color.fromARGB(255, 132, 18, 10),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
