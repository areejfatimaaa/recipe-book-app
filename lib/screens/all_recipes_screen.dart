import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/recipe_model.dart';
import '../providers/recipe_provider.dart';
import 'recipe_detail_screen.dart';

class AllRecipesScreen extends StatelessWidget {
  const AllRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeProvider>(
      builder: (context, recipeProvider, child) {
        final recipes = recipeProvider.recipes;

        return Scaffold(
          appBar: AppBar(
            title: const Text('All Recipes'),
            backgroundColor: Colors.green,
          ),
          body: recipes.isEmpty
              ? const Center(child: Text('No recipes available'))
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = recipes[index];

                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
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
                        title: Text(
                          recipe.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${recipe.category} • ${recipe.time}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                recipe.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: recipe.isFavorite
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                recipeProvider.toggleFavorite(index);
                              },
                            ),
                            if (!recipe.isSystemRecipe)
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Colors.grey),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title: const Text('Delete Recipe'),
                                      content: const Text(
                                          'Are you sure you want to delete this recipe?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(ctx).pop(),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            recipeProvider
                                                .deleteRecipe(index);
                                            Navigator.of(ctx).pop();
                                          },
                                          child: const Text(
                                            'Delete',
                                            style: TextStyle(
                                                color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                          ],
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
