import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'favorites_screen.dart';
import 'all_recipes_screen.dart';
import 'add_recipe.dart';
import 'my_recipes_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  DateTime? lastPressed;

  final List<Widget> _screens = [
    const HomeScreen(),
    const FavoritesScreen(),
    const AllRecipesScreen(),
    const AddRecipeScreen(),
    const MyRecipesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // prevent default back pop
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        // If user is not on the Home screen, go back to Home
        if (_selectedIndex != 0) {
          setState(() => _selectedIndex = 0);
          return;
        }

        // If user is already on Home, ask for double back press to exit
        final now = DateTime.now();
        if (lastPressed == null ||
            now.difference(lastPressed!) > const Duration(seconds: 2)) {
          lastPressed = now;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Press back again to exit')),
          );
          return;
        }

        // Exit app
        Navigator.of(context).maybePop();
      },
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'All Recipes'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Recipe'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My Recipes'),
          ],
        ),
      ),
    );
  }
}
