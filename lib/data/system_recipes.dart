
import 'package:recipe_book_app/models/recipe_model.dart';

final List<Recipe> systemRecipes = [
  Recipe(
    name: 'Cold Coffee',
    imagePath: 'assets/images/cold_coffee.jpg',
    category: 'Breakfast',
    difficulty: 'Easy',
    time: '10 mins',
    ingredients: ['1 cup milk', '2 tsp coffee powder', '2 tsp sugar', 'Ice cubes'],
    steps: [
      'Blend milk, coffee powder, sugar, and ice cubes in a blender.',
      'Pour into a glass and serve chilled.'
    ],
    isSystemRecipe: true,
    isFavorite: false,
  ),
  Recipe(
    name: 'Pakora',
    imagePath: 'assets/images/pakora.jpg',
    category: 'Snacks',
    difficulty: 'Medium',
    time: '25 mins',
    ingredients: ['1 cup gram flour', 'Vegetables', 'Salt', 'Spices', 'Oil for frying'],
    steps: [
      'Mix gram flour, salt, and spices into a batter.',
      'Dip vegetables in batter and deep fry until golden brown.',
      'Serve hot with chutney.'
    ],
    isSystemRecipe: true,
    isFavorite: false,
  ),
  Recipe(
    name: 'Spring Rolls',
    imagePath: 'assets/images/spring_rolls.jpg',
    category: 'Snacks',
    difficulty: 'Medium',
    time: '30 mins',
    ingredients: ['Spring roll wrappers', 'Cabbage', 'Carrot', 'Capsicum', 'Oil for frying'],
    steps: [
      'Stir fry the vegetables lightly.',
      'Fill wrappers with vegetables and roll tightly.',
      'Deep fry until golden brown.',
      'Serve with sauce.'
    ],
    isSystemRecipe: true,
    isFavorite: false,
  ),
  Recipe(
    name: 'Karhi Pakora',
    imagePath: 'assets/images/karhi_pakora.jpg',
    category: 'Lunch',
    difficulty: 'Hard',
    time: '60 mins',
    ingredients: ['Gram flour', 'Yogurt', 'Spices', 'Oil', 'Water'],
    steps: [
      'Prepare pakora batter and fry small pakoras.',
      'Make yogurt gravy with spices.',
      'Add pakoras to gravy and simmer for 20 minutes.',
      'Serve hot with rice.'
    ],
    isSystemRecipe: true,
    isFavorite: false,
  ),
  Recipe(
    name: 'Fried Rice',
    imagePath: 'assets/images/fried_rice.jpg',
    category: 'Dinner',
    difficulty: 'Easy',
    time: '20 mins',
    ingredients: ['2 cups cooked rice', 'Mixed vegetables', 'Soy sauce', 'Oil', 'Salt'],
    steps: [
      'Heat oil in a pan.',
      'Add vegetables and stir fry for 5 minutes.',
      'Add rice and soy sauce.',
      'Mix well and cook for another 5 minutes.',
      'Serve hot.'
    ],
    isSystemRecipe: true,
    isFavorite: false,
  ),
  Recipe(
    name: 'Pancakes',
    imagePath: 'assets/images/pancakes.jpg',
    category: 'Breakfast',
    difficulty: 'Easy',
    time: '15 mins',
    ingredients: ['1 cup flour', '1 egg', '1 cup milk', '1 tsp sugar', 'Butter for cooking'],
    steps: [
      'Mix flour, egg, milk, and sugar into a smooth batter.',
      'Heat pan and cook batter in small rounds until golden brown.',
      'Serve with syrup or honey.'
    ],
    isSystemRecipe: true,
    isFavorite: false,
  ),
  Recipe(
    name: 'Aloo Paratha',
    imagePath: 'assets/images/aloo_paratha.jpg',
    category: 'Breakfast',
    difficulty: 'Medium',
    time: '30 mins',
    ingredients: ['Wheat flour', 'Boiled potatoes', 'Salt', 'Spices', 'Oil or ghee'],
    steps: [
      'Prepare dough from wheat flour and water.',
      'Mash potatoes with salt and spices.',
      'Stuff dough with potato mixture and roll out.',
      'Cook on tawa with oil until golden brown.',
      'Serve hot with yogurt or pickle.'
    ],
    isSystemRecipe: true,
    isFavorite: false,
  ),
  Recipe(
    name: 'Daal Chawal',
    imagePath: 'assets/images/daal_chawal.jpg',
    category: 'Dinner',
    difficulty: 'Easy',
    time: '25 mins',
    ingredients: ['1 cup lentils', 'Rice', 'Spices', 'Oil', 'Salt', 'Water'],
    steps: [
      'Cook lentils with spices until soft.',
      'Boil rice separately.',
      'Serve daal over rice.'
    ],
    isSystemRecipe: true,
    isFavorite: false,
  ),
  Recipe(
    name: 'Chicken Biryani',
    imagePath: 'assets/images/chicken_biryani.jpg',
    category: 'Dinner',
    difficulty: 'Hard',
    time: '60 mins',
    ingredients: ['Basmati rice', 'Chicken', 'Spices', 'Yogurt', 'Oil'],
    steps: [
      'Marinate chicken with spices and yogurt.',
      'Cook rice partially.',
      'Layer chicken and rice, cook together until done.',
      'Serve hot with raita.'
    ],
    isSystemRecipe: true,
    isFavorite: false,
  ),
  Recipe(
    name: 'Chicken Karahi',
    imagePath: 'assets/images/chicken_karahi.jpg',
    category: 'Lunch',
    difficulty: 'Medium',
    time: '40 mins',
    ingredients: ['Chicken', 'Tomatoes', 'Green chilies', 'Spices', 'Oil'],
    steps: [
      'Heat oil and fry chicken with spices.',
      'Add tomatoes and cook until soft.',
      'Simmer until chicken is cooked.',
      'Garnish with green chilies and coriander.',
      'Serve hot.'
    ],
    isSystemRecipe: true,
    isFavorite: false,
  ),
  Recipe(
    name: 'Pasta Alfredo',
    imagePath: 'assets/images/pasta_alfredo.jpg',
    category: 'Lunch',
    difficulty: 'Medium',
    time: '25 mins',
    ingredients: ['Pasta', 'Cream', 'Cheese', 'Garlic', 'Butter', 'Salt'],
    steps: [
      'Cook pasta until al dente.',
      'Prepare Alfredo sauce with cream, cheese, garlic, and butter.',
      'Mix pasta with sauce and serve hot.'
    ],
    isSystemRecipe: true,
    isFavorite: false,
  ),
  Recipe(
    name: 'Chaat Papri',
    imagePath: 'assets/images/chaat_papri.jpg',
    category: 'Snacks',
    difficulty: 'Easy',
    time: '15 mins',
    ingredients: ['Papri', 'Boiled potatoes', 'Chickpeas', 'Chutney', 'Yogurt', 'Spices'],
    steps: [
      'Arrange papri on a plate.',
      'Top with boiled potatoes, chickpeas, yogurt, and chutney.',
      'Sprinkle spices and serve immediately.'
    ],
    isSystemRecipe: true,
    isFavorite: false,
  ),
];
