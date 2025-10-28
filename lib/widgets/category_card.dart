import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';
import '../screens/category_recipe_screen.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  const CategoryCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryRecipeScreen(
              category: name,
              recipes: recipeProvider.recipes, // Pass the full recipe list
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: _getPastelColor(name),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  
  Color _getPastelColor(String category) {
    switch (category.toLowerCase()) {
      case 'breakfast':
        return Colors.yellow[100]!;
      case 'lunch':
        return Colors.green[100]!;
      case 'dinner':
        return Colors.blue[100]!;
      case 'dessert':
        return Colors.pink[100]!;
      case 'drinks':
        return Colors.purple[100]!;
      default:
        return Colors.red[200]!;
    }
  }
}
