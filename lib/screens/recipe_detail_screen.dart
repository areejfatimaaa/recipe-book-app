import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/recipe_model.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  late Recipe recipe;
  late Box<Recipe> recipeBox;

  @override
  void initState() {
    super.initState();
    recipe = widget.recipe;
    recipeBox = Hive.box<Recipe>('recipesBox');
  }

  void toggleFavorite() {
    setState(() {
      recipe.isFavorite = !recipe.isFavorite;
      recipe.save();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          recipe.isFavorite
              ? '❤️ Added to favourites'
              : '💔 Removed from favourites',
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor:
            recipe.isFavorite ? Colors.pinkAccent : Colors.grey[700],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ✅ Modern Image with overlay text
            Stack(
              children: [
                // Image (asset or file)
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: recipe.imagePath.isNotEmpty
                      ? (recipe.imagePath.startsWith('assets/')
                          ? Image.asset(
                              recipe.imagePath,
                              width: double.infinity,
                              height: 220,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              File(recipe.imagePath),
                              width: double.infinity,
                              height: 220,
                              fit: BoxFit.cover,
                            ))
                      : const SizedBox(
                          width: double.infinity,
                          height: 220,
                          child: Center(child: Text('No Image')),
                        ),
                ),

                // Overlay Text
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black54,
                              offset: Offset(1, 1),
                              blurRadius: 2,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        recipe.category,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          shadows: [
                            Shadow(
                              color: Colors.black54,
                              offset: Offset(1, 1),
                              blurRadius: 2,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      // Difficulty & Time tags
                      Row(
                        children: [
                          if (recipe.difficulty.isNotEmpty)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                recipe.difficulty,
                                style: const TextStyle(color: Colors.white, fontSize: 14),
                              ),
                            ),
                          if (recipe.time.isNotEmpty)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                recipe.time,
                                style: const TextStyle(color: Colors.white, fontSize: 14),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Favorite button
                Positioned(
                  top: 40,
                  right: 16,
                  child: IconButton(
                    icon: Icon(
                      recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: recipe.isFavorite ? Colors.pink : Colors.white,
                      size: 28,
                    ),
                    onPressed: toggleFavorite,
                  ),
                ),

                // Back button
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ingredients
                  const Text(
                    "Ingredients",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...recipe.ingredients.map(
                    (ingredient) => Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("• ",
                              style: TextStyle(fontSize: 16, color: Colors.black87)),
                          Expanded(
                            child: Text(
                              ingredient,
                              style: const TextStyle(fontSize: 16, height: 1.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Instructions
                  const Text(
                    "Instructions",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...recipe.steps.asMap().entries.map(
                    (entry) {
                      int index = entry.key + 1;
                      String step = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$index. ",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                step,
                                style: const TextStyle(fontSize: 16, height: 1.5),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
