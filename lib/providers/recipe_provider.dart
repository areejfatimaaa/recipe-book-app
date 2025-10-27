import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../models/recipe_model.dart';

class RecipeProvider extends ChangeNotifier {
  final Box<Recipe> _recipeBox = Hive.box<Recipe>('recipesBox');

  List<Recipe> get recipes => _recipeBox.values.toList();

  void addRecipe(Recipe recipe) {
    _recipeBox.add(recipe);
    notifyListeners();
  }

  void deleteRecipe(int index) {
    _recipeBox.deleteAt(index);
    notifyListeners();
  }

  void toggleFavorite(int index) {
    final recipe = _recipeBox.getAt(index);
    recipe!.isFavorite = !recipe.isFavorite;
    recipe.save();
    notifyListeners();
  }
}
