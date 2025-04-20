import 'package:flutter/material.dart';

// App Constants
class AppConstants {
  // App Information
  static const String appName = 'SHOPPLY';
  static const String appVersion = '1.0.0';
  
  // SharedPreferences Keys
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language';
  static const String wishlistKey = 'wishlist';
  static const String clickHistoryKey = 'click_history';
  static const String loginKey = 'is_logged_in';
  static const String userEmailKey = 'user_email';
  
  // Language Options
  static const String english = 'en';
  static const String french = 'fr';
  
  // Route Names
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String productDetailsRoute = '/product-details';
  static const String profileRoute = '/profile';
  static const String searchRoute = '/search';
  static const String wishlistRoute = '/wishlist';
  static const String cartRoute = '/cart';
  static const String settingsRoute = '/settings';

  // Base URLs
  static const String imageBaseUrl = 'https://raw.githubusercontent.com/hp/affiliation/main/assets/images/';
  static const String placeholderImage = 'https://via.placeholder.com/300x300';
}

// Language Translations
class AppText {
  static Map<String, Map<String, String>> translations = {
    'en': {
      // General
      'appName': 'SHOPPLY',
      'search': 'Search products...',
      'seeAll': 'See All',
      'loading': 'Loading...',
      
      // Home Page
      'topDeals': 'Top Deals',
      'trending': 'Trending',
      'newArrivals': 'New Arrivals',
      'recommended': 'Recommended',
      'categories': 'Categories',
      
      // Categories
      'electronics': 'Electronics',
      'fashion': 'Fashion',
      'home': 'Home & Living',
      'beauty': 'Beauty',
      'sports': 'Sports',
      'toys': 'Toys',
      'books': 'Books',
      
      // Product Details
      'description': 'Description',
      'reviews': 'Reviews',
      'specifications': 'Specifications',
      'buyNow': 'Buy Now',
      'addToWishlist': 'Add to Wishlist',
      'removeFromWishlist': 'Remove from Wishlist',
      
      // Profile
      'profile': 'Profile',
      'myClicks': 'My Clicks',
      'myWishlist': 'My Wishlist',
      'settings': 'Settings',
      'logout': 'Logout',
      
      // Settings
      'darkMode': 'Dark Mode',
      'language': 'Language',
      'notifications': 'Notifications',
      'english': 'English',
      'french': 'French',
      
      // Cart/Wishlist
      'emptyWishlist': 'Your wishlist is empty',
      'noClicks': 'You haven\'t clicked on any products yet',
    },
    'fr': {
      // General
      'appName': 'SHOPPLY',
      'search': 'Rechercher des produits...',
      'seeAll': 'Voir Tout',
      'loading': 'Chargement...',
      
      // Home Page
      'topDeals': 'Meilleures Offres',
      'trending': 'Tendance',
      'newArrivals': 'Nouveautés',
      'recommended': 'Recommandé',
      'categories': 'Catégories',
      
      // Categories
      'electronics': 'Électronique',
      'fashion': 'Mode',
      'home': 'Maison & Déco',
      'beauty': 'Beauté',
      'sports': 'Sports',
      'toys': 'Jouets',
      'books': 'Livres',
      
      // Product Details
      'description': 'Description',
      'reviews': 'Avis',
      'specifications': 'Spécifications',
      'buyNow': 'Acheter',
      'addToWishlist': 'Ajouter aux Favoris',
      'removeFromWishlist': 'Retirer des Favoris',
      
      // Profile
      'profile': 'Profil',
      'myClicks': 'Mes Clics',
      'myWishlist': 'Mes Favoris',
      'settings': 'Paramètres',
      'logout': 'Déconnexion',
      
      // Settings
      'darkMode': 'Mode Sombre',
      'language': 'Langue',
      'notifications': 'Notifications',
      'english': 'Anglais',
      'french': 'Français',
      
      // Cart/Wishlist
      'emptyWishlist': 'Votre liste de souhaits est vide',
      'noClicks': 'Vous n\'avez encore cliqué sur aucun produit',
    },
  };

  static const Map<String, String> login = {
    AppConstants.english: 'Login',
    AppConstants.french: 'Connexion',
  };

  static const Map<String, String> email = {
    AppConstants.english: 'Email',
    AppConstants.french: 'Email',
  };

  static const Map<String, String> password = {
    AppConstants.english: 'Password',
    AppConstants.french: 'Mot de passe',
  };

  static const Map<String, String> emailRequired = {
    AppConstants.english: 'Please enter your email',
    AppConstants.french: 'Veuillez entrer votre email',
  };

  static const Map<String, String> invalidEmail = {
    AppConstants.english: 'Please enter a valid email',
    AppConstants.french: 'Veuillez entrer un email valide',
  };

  static const Map<String, String> passwordRequired = {
    AppConstants.english: 'Please enter your password',
    AppConstants.french: 'Veuillez entrer votre mot de passe',
  };

  static const Map<String, String> passwordTooShort = {
    AppConstants.english: 'Password must be at least 6 characters',
    AppConstants.french: 'Le mot de passe doit contenir au moins 6 caractères',
  };

  static const Map<String, String> logout = {
    AppConstants.english: 'Logout',
    AppConstants.french: 'Déconnexion',
  };

  static const Map<String, String> lightMode = {
    AppConstants.english: 'Light Mode',
    AppConstants.french: 'Mode Clair',
  };

  static const Map<String, String> darkMode = {
    AppConstants.english: 'Dark Mode',
    AppConstants.french: 'Mode Sombre',
  };

  static const Map<String, String> about = {
    AppConstants.english: 'About',
    AppConstants.french: 'À propos',
  };

  static const Map<String, String> help = {
    AppConstants.english: 'Help',
    AppConstants.french: 'Aide',
  };
}

// Sample Categories
class CategoryData {
  static List<Map<String, dynamic>> categories = [
    {
      'id': 'electronics',
      'name': 'Electronics',
      'icon': '0xe1d4', // Icons.devices
    },
    {
      'id': 'fashion',
      'name': 'Fashion',
      'icon': '0xe59c', // Icons.shopping_bag
    },
    {
      'id': 'home',
      'name': 'Home & Living',
      'icon': '0xe148', // Icons.chair
    },
    {
      'id': 'beauty',
      'name': 'Beauty',
      'icon': '0xe1d9', // Icons.face
    },
    {
      'id': 'sports',
      'name': 'Sports',
      'icon': '0xe52b', // Icons.sports_basketball
    },
    {
      'id': 'toys',
      'name': 'Toys',
      'icon': '0xe5c3', // Icons.toys
    },
    {
      'id': 'books',
      'name': 'Books',
      'icon': '0xe0e1', // Icons.book
    },
  ];
}

// Sample Products
class ProductData {
  static List<Map<String, dynamic>> products = [
    {
      'id': 'p1',
      'title': 'Wireless Noise Cancelling Headphones',
      'description': 'Premium wireless headphones with active noise cancellation, providing immersive sound quality and comfort for extended listening sessions.',
      'price': 199.99,
      'discountPercentage': 15,
      'rating': 4.7,
      'category': 'electronics',
      'images': [
        'headphones_1.jpg',
        'headphones_2.jpg',
        'headphones_3.jpg'
      ],
      'affiliateUrl': 'https://example.com/affiliate/p1',
      'specifications': [
        'Battery Life: 30 hours',
        'Bluetooth 5.0',
        'Active Noise Cancellation',
        'Touch Controls',
        'Voice Assistant Compatible',
      ],
      'reviews': [
        {
          'username': 'AudioFan',
          'rating': 5,
          'comment': 'Amazing sound quality and the noise cancellation is top-notch!',
          'date': '2023-04-15',
        },
        {
          'username': 'MusicLover',
          'rating': 4,
          'comment': 'Very comfortable but a bit pricey.',
          'date': '2023-03-22',
        },
      ],
    },
    {
      'id': 'p2',
      'title': 'Smart Fitness Watch',
      'description': 'Track your fitness goals with this advanced smartwatch featuring heart rate monitoring, GPS tracking, and sleep analysis.',
      'price': 149.99,
      'discountPercentage': 10,
      'rating': 4.5,
      'category': 'electronics',
      'images': [
        'watch_1.jpg',
        'watch_2.jpg',
      ],
      'affiliateUrl': 'https://example.com/affiliate/p2',
      'specifications': [
        'Water Resistant (50m)',
        'Heart Rate Monitor',
        'Sleep Tracking',
        'GPS',
        '7-day Battery Life',
      ],
      'reviews': [
        {
          'username': 'FitnessGuru',
          'rating': 5,
          'comment': 'This watch has improved my training routine significantly!',
          'date': '2023-05-02',
        },
      ],
    },
    {
      'id': 'p3',
      'title': 'Premium Leather Laptop Bag',
      'description': 'Elegant and durable leather laptop bag with multiple compartments for organization and style.',
      'price': 89.99,
      'discountPercentage': 0,
      'rating': 4.8,
      'category': 'fashion',
      'images': [
        'bag_1.jpg',
        'bag_2.jpg',
        'bag_3.jpg',
      ],
      'affiliateUrl': 'https://example.com/affiliate/p3',
      'specifications': [
        'Genuine Leather',
        'Fits up to 15.6" laptops',
        'Multiple pockets',
        'Adjustable shoulder strap',
        'Water-resistant lining',
      ],
      'reviews': [
        {
          'username': 'BusinessTraveler',
          'rating': 5,
          'comment': 'Elegant design and very practical for daily use.',
          'date': '2023-02-18',
        },
        {
          'username': 'StyleConscious',
          'rating': 4,
          'comment': 'Beautiful bag but could use more padding for the laptop compartment.',
          'date': '2023-01-30',
        },
      ],
    },
    {
      'id': 'p4',
      'title': 'Organic Skincare Set',
      'description': 'Complete skincare routine with natural, organic ingredients for radiant and healthy skin.',
      'price': 59.99,
      'discountPercentage': 20,
      'rating': 4.6,
      'category': 'beauty',
      'images': [
        'skincare_1.jpg',
        'skincare_2.jpg',
      ],
      'affiliateUrl': 'https://example.com/affiliate/p4',
      'specifications': [
        '100% Organic Ingredients',
        'Paraben-free',
        'Cruelty-free',
        'Suitable for all skin types',
        'Includes: Cleanser, Toner, Moisturizer, and Serum',
      ],
      'reviews': [
        {
          'username': 'SkinCareAddict',
          'rating': 5,
          'comment': 'My skin has never looked better! Love these products.',
          'date': '2023-04-05',
        },
      ],
    },
    {
      'id': 'p5',
      'title': 'Smart Home Speaker',
      'description': 'Voice-controlled smart speaker with premium sound quality and home automation capabilities.',
      'price': 129.99,
      'discountPercentage': 5,
      'rating': 4.4,
      'category': 'electronics',
      'images': [
        'speaker_1.jpg',
        'speaker_2.jpg',
      ],
      'affiliateUrl': 'https://example.com/affiliate/p5',
      'specifications': [
        'Voice Assistant Integration',
        'Multi-room Audio Support',
        'Bluetooth and Wi-Fi Connectivity',
        '360° Sound',
        'Compatible with major smart home platforms',
      ],
      'reviews': [
        {
          'username': 'TechEnthusiast',
          'rating': 4,
          'comment': 'Great sound but occasional connectivity issues.',
          'date': '2023-03-15',
        },
        {
          'username': 'SmartHomeExpert',
          'rating': 5,
          'comment': 'Seamless integration with my existing smart home setup!',
          'date': '2023-02-28',
        },
      ],
    },
    {
      'id': 'p6',
      'title': 'Professional Chef Knife Set',
      'description': 'High-quality stainless steel knife set with ergonomic handles for precise cutting and cooking.',
      'price': 169.99,
      'discountPercentage': 10,
      'rating': 4.9,
      'category': 'home',
      'images': [
        'knives_1.jpg',
        'knives_2.jpg',
      ],
      'affiliateUrl': 'https://example.com/affiliate/p6',
      'specifications': [
        'High-carbon stainless steel',
        '6-piece set',
        'Ergonomic handles',
        'Includes wooden storage block',
        'Dishwasher safe',
      ],
      'reviews': [
        {
          'username': 'HomeCook',
          'rating': 5,
          'comment': 'These knives have transformed my cooking experience!',
          'date': '2023-05-10',
        },
      ],
    },
    {
      'id': 'p7',
      'title': 'Yoga Mat and Accessories Set',
      'description': 'Complete yoga set including non-slip mat, blocks, strap, and towel for all levels of practice.',
      'price': 49.99,
      'discountPercentage': 0,
      'rating': 4.3,
      'category': 'sports',
      'images': [
        'yoga_1.jpg',
        'yoga_2.jpg',
      ],
      'affiliateUrl': 'https://example.com/affiliate/p7',
      'specifications': [
        'Eco-friendly materials',
        'Non-slip surface',
        'Includes: Mat, 2 blocks, strap, and towel',
        'Carrying bag included',
        'Easy to clean',
      ],
      'reviews': [
        {
          'username': 'YogaEnthusiast',
          'rating': 4,
          'comment': 'Great starter set, the mat could be a bit thicker though.',
          'date': '2023-04-22',
        },
      ],
    },
    {
      'id': 'p8',
      'title': 'Bestselling Novel Collection',
      'description': 'Set of five bestselling novels from acclaimed authors, perfect for book lovers and avid readers.',
      'price': 79.99,
      'discountPercentage': 15,
      'rating': 4.7,
      'category': 'books',
      'images': [
        'books_1.jpg',
        'books_2.jpg',
      ],
      'affiliateUrl': 'https://example.com/affiliate/p8',
      'specifications': [
        'Hardcover editions',
        '5-book collection',
        'Award-winning titles',
        'Includes reading guide',
        'Gift-ready packaging',
      ],
      'reviews': [
        {
          'username': 'BookWorm',
          'rating': 5,
          'comment': 'Excellent selection of books, couldn\'t put them down!',
          'date': '2023-03-30',
        },
      ],
    },
  ];
  
  // Helper method to get products by category
  static List<Map<String, dynamic>> getProductsByCategory(String category) {
    return products.where((product) => product['category'] == category).toList();
  }
  
  // Helper method to get product by id
  static Map<String, dynamic>? getProductById(String id) {
    try {
      return products.firstWhere((product) => product['id'] == id);
    } catch (e) {
      return null;
    }
  }
  
  // Helper method to get featured products (those with discount)
  static List<Map<String, dynamic>> getFeaturedProducts() {
    return products.where((product) => product['discountPercentage'] > 0).toList();
  }
  
  // Helper method to get top rated products
  static List<Map<String, dynamic>> getTopRatedProducts() {
    List<Map<String, dynamic>> sortedProducts = List.from(products);
    sortedProducts.sort((a, b) => (b['rating'] as double).compareTo(a['rating'] as double));
    return sortedProducts.take(5).toList();
  }
  
  // Helper method to search products by title
  static List<Map<String, dynamic>> searchProducts(String query) {
    return products.where((product) => 
      product['title'].toString().toLowerCase().contains(query.toLowerCase()) ||
      product['description'].toString().toLowerCase().contains(query.toLowerCase())
    ).toList();
  }
} 