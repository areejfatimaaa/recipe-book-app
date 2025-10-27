import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';
import '../models/recipe_model.dart';
import 'recipe_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecipeProvider>(context);
    final favoriteRecipes = provider.recipes.where((r) => r.isFavorite).toList();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("Favorites"),
        backgroundColor: Colors.green,
      ),
      body: favoriteRecipes.isEmpty
          ? const Center(
              child: Text(
                "No favorites yet!",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                final recipe = favoriteRecipes[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        recipe.imagePath,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      recipe.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      "${recipe.category} • ${recipe.time}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.red),
                      onPressed: () {
                        provider.toggleFavorite(provider.recipes.indexOf(recipe));

                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailScreen(recipe: recipe),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/recipe_provider.dart';
// import 'recipe_detail_screen.dart';

// class FavoritesScreen extends StatelessWidget {
//   const FavoritesScreen({super.key});


//   @override
//   Widget build(BuildContext context) {
//     final recipeProvider = Provider.of<RecipeProvider>(context);
//     final favoriteRecipes = recipeProvider.favoriteRecipes;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Favorite Recipes'),
//         backgroundColor: Colors.green,
//       ),
//       body: favoriteRecipes.isEmpty
//           ? const Center(
//               child: Text('No favorite recipes yet..'),
//             )
//           : ListView.builder(
//               padding: const EdgeInsets.all(12),
//               itemCount: favoriteRecipes.length,
//               itemBuilder: (context, index) {
//                 final recipe = favoriteRecipes[index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => RecipeDetailScreen(recipe: recipe),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     elevation: 4,
//                     margin: const EdgeInsets.only(bottom: 10),
//                     child: ListTile(
//                       leading: Image.asset(recipe.imagePath,
//                           width: 50, height: 50, fit: BoxFit.cover),
//                       title: Text(recipe.name),
//                       subtitle: Text(recipe.time),
//                       trailing: IconButton(
//                         icon: const Icon(Icons.favorite, color: Colors.red),
//                         onPressed: () {
//                           recipeProvider.toggleFavorite(recipe);
//                         },
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
