import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/recipe_model.dart';
import '../providers/recipe_provider.dart';
import 'recipe_detail_screen.dart';

class MyRecipesScreen extends StatelessWidget {
  const MyRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeProvider>(
      builder: (context, recipeProvider, child) {
        // Only user-added recipes
        final userRecipes =
            recipeProvider.recipes.where((r) => !r.isSystemRecipe).toList();

        return Scaffold(
          appBar: AppBar(
            title: const Text('My Recipes'),
            backgroundColor: Colors.green,
          ),
          body: userRecipes.isEmpty
              ? const Center(
                  child: Text(
                    'You have not added any recipes yet',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: userRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe = userRecipes[index];

                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 3,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            recipe.imagePath.isNotEmpty
                                ? recipe.imagePath
                                : 'assets/default.jpg',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(recipe.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(
                            "${recipe.category} • ${recipe.time} • ${recipe.difficulty}",
                            style: const TextStyle(color: Colors.grey)),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.grey),
                          onPressed: () {
                            recipeProvider.deleteRecipe(
                                recipeProvider.recipes.indexOf(recipe));
                          },
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RecipeDetailScreen(recipe: recipe),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
