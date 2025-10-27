import 'package:flutter/material.dart';
import '../models/recipe_model.dart';
import 'recipe_detail_screen.dart';

class CategoryRecipeScreen extends StatelessWidget {
  final String category;
  final List<Recipe> recipes;

  const CategoryRecipeScreen({
    super.key,
    required this.category,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    // Filter recipes for this category
    final filteredRecipes = recipes.where((r) => r.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Recipes'),
        backgroundColor: Colors.green,
      ),
      body: filteredRecipes.isEmpty
          ? const Center(
              child: Text(
                'No recipes found for this category.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: filteredRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = filteredRecipes[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailScreen(recipe: recipe),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 3,
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          // Recipe image
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                            child: Image.asset(
                              recipe.imagePath,
                              width: 120, // ✅ fixed smaller width
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),

                          // Recipe info
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    recipe.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Difficulty: ${recipe.difficulty}',
                                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Time: ${recipe.time}',
                                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
