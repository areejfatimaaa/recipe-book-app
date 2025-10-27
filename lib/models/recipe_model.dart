import 'package:hive/hive.dart';

part 'recipe_model.g.dart';

@HiveType(typeId: 0)
class Recipe extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String imagePath;

  @HiveField(2)
  String time;

  @HiveField(3)
  String category;

  @HiveField(4)
  List<String> ingredients;

  @HiveField(5)
  List<String> steps;

  @HiveField(6)
  bool isSystemRecipe;

  @HiveField(7)
  bool isFavorite;

  @HiveField(8)
  String difficulty;

  @HiveField(9)
  bool isUserRecipe;

  Recipe({
    required this.name,
    required this.imagePath,
    required this.time,
    this.category = '',
    this.ingredients = const [],
    this.steps = const [],
    this.isSystemRecipe = true,
    this.isFavorite = false,
    this.difficulty = 'Medium',
    this.isUserRecipe= false,
  });
}
