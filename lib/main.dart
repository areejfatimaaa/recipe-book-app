import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_book_app/screens/main_screen.dart';
import 'models/recipe_model.dart';
import 'providers/recipe_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/name_screen.dart';
import 'data/system_recipes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeAdapter());
  var recipesBox= await Hive.openBox<Recipe> ('recipesBox');
  //adding system recipes if box is empty
  if(recipesBox.isEmpty){
    recipesBox.addAll(systemRecipes);
  }
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeProvider()),
      ],
      child: const RecipeApp(),
    ),
  );
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Book',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/name': (context) => const NameScreen(),
        '/home': (context) => const MainScreen(),
        
      },
    );
  }
}
