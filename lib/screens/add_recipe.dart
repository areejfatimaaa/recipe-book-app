import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/recipe_model.dart';
import '../providers/recipe_provider.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _difficultyController = TextEditingController();
  final _timeController = TextEditingController();

  // Dynamic lists for ingredients and steps
  final List<String> _ingredients = [];
  final List<String> _steps = [];

  final _ingredientController = TextEditingController();
  final _stepController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _difficultyController.dispose();
    _timeController.dispose();
    _ingredientController.dispose();
    _stepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Add Recipe'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipe Image (default only)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/default.jpg',
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),

              // Text Fields
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Recipe Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter recipe name' : null,
              ),
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(labelText: 'Category'),
              ),
              TextFormField(
                controller: _difficultyController,
                decoration: const InputDecoration(labelText: 'Difficulty'),
              ),
              TextFormField(
                controller: _timeController,
                decoration: const InputDecoration(
                  labelText: 'Time (e.g. 30 mins)',
                ),
              ),
              const SizedBox(height: 16),

              // Ingredients input
              const Text(
                'Ingredients',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _ingredientController,
                      decoration: const InputDecoration(
                        hintText: 'Enter ingredient',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.green),
                    onPressed: () {
                      final text = _ingredientController.text.trim();
                      if (text.isNotEmpty) {
                        setState(() {
                          _ingredients.add(text);
                          _ingredientController.clear();
                        });
                      }
                    },
                  ),
                ],
              ),
              Wrap(
                children: _ingredients
                    .map(
                      (i) => Chip(
                        label: Text(i),
                        onDeleted: () {
                          setState(() {
                            _ingredients.remove(i);
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 16),

              // Steps input
              const Text(
                'Steps',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _stepController,
                      decoration: const InputDecoration(hintText: 'Enter step'),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.green),
                    onPressed: () {
                      final text = _stepController.text.trim();
                      if (text.isNotEmpty) {
                        setState(() {
                          _steps.add(text);
                          _stepController.clear();
                        });
                      }
                    },
                  ),
                ],
              ),
              Wrap(
                children: _steps
                    .asMap()
                    .entries
                    .map(
                      (e) => Chip(
                        label: Text('${e.key + 1}. ${e.value}'),
                        onDeleted: () {
                          setState(() {
                            _steps.removeAt(e.key);
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 20),

              // Save button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newRecipe = Recipe(
                      name: _nameController.text,
                      category: _categoryController.text,
                      difficulty: _difficultyController.text,
                      time: _timeController.text,
                      imagePath: 'assets/images/default.jpg',
                      ingredients: List.from(_ingredients),
                      steps: List.from(_steps),
                      isFavorite: false,
                      isSystemRecipe: false,
                    );

                    try {
                      Provider.of<RecipeProvider>(
                        context,
                        listen: false,
                      ).addRecipe(newRecipe);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Recipe added successfully!'),
                          duration: Duration(seconds: 2),
                        ),
                      );

                      Navigator.of(
                        context,
                      ).pushNamedAndRemoveUntil('/home', (route) => false);
                      // Go back safely
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error saving recipe: $e'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Save Recipe',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
