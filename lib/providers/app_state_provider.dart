import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

import '../models/product_model.dart';
import '../utils/app_constants.dart';

class AppStateProvider with ChangeNotifier {
  final SharedPreferences prefs;

  // Theme state
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  // Language state
  String _language = AppConstants.english;
  String get language => _language;

  // Wishlist
  List<Product> _wishlist = [];
  List<Product> get wishlist => _wishlist;

  // Click history
  List<Product> _clickHistory = [];
  List<Product> get clickHistory => _clickHistory;

  // Search query
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  // Selected category
  String? _selectedCategory;
  String? get selectedCategory => _selectedCategory;

  // Loading state
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Products
  List<Product> _allProducts = [];
  List<Product> get allProducts => _allProducts;

  List<Product> _filteredProducts = [];
  List<Product> get filteredProducts => _filteredProducts;

  // Categories
  List<Category> _categories = [];
  List<Category> get categories => _categories;

  // Login state
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  // User email
  String? _userEmail;
  String? get userEmail => _userEmail;

  AppStateProvider(this.prefs) {
    _loadPreferences();
    _loadProducts();
    _loadCategories();
  }

  void _loadPreferences() {
    try {
      _isDarkMode = prefs.getBool(AppConstants.themeKey) ?? false;
      _language = prefs.getString(AppConstants.languageKey) ?? AppConstants.english;
      _isLoggedIn = prefs.getBool(AppConstants.loginKey) ?? false;
      _userEmail = prefs.getString(AppConstants.userEmailKey);
      
      final wishlistJson = prefs.getStringList(AppConstants.wishlistKey) ?? [];
      _wishlist = [];
      for (var jsonStr in wishlistJson) {
        try {
          final map = json.decode(jsonStr) as Map<String, dynamic>;
          _wishlist.add(Product.fromJson(map));
        } catch (e) {
          debugPrint('Error parsing wishlist item: $e');
          // Skip invalid items
        }
      }
      
      final clickHistoryJson = prefs.getStringList(AppConstants.clickHistoryKey) ?? [];
      _clickHistory = [];
      for (var jsonStr in clickHistoryJson) {
        try {
          final map = json.decode(jsonStr) as Map<String, dynamic>;
          _clickHistory.add(Product.fromJson(map));
        } catch (e) {
          debugPrint('Error parsing click history item: $e');
          // Skip invalid items
        }
      }
    } catch (e) {
      debugPrint('Error loading preferences: $e');
      // Reset to defaults if there's an error
      _isDarkMode = false;
      _language = AppConstants.english;
      _isLoggedIn = false;
      _userEmail = null;
      _wishlist = [];
      _clickHistory = [];
    }
  }

  void _loadProducts() {
    _allProducts = ProductData.products
        .map((productJson) => Product.fromJson(productJson))
        .toList();
    _filteredProducts = List.from(_allProducts);
    notifyListeners();
  }

  void _loadCategories() {
    _categories = CategoryData.categories
        .map((categoryJson) => Category.fromJson(categoryJson))
        .toList();
    notifyListeners();
  }

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    prefs.setBool(AppConstants.themeKey, _isDarkMode);
    notifyListeners();
  }

  void setLanguage(String languageCode) {
    if (languageCode != AppConstants.english && languageCode != AppConstants.french) {
      return;
    }
    _language = languageCode;
    prefs.setString(AppConstants.languageKey, _language);
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    _isLoggedIn = true;
    _userEmail = email;
    await prefs.setBool(AppConstants.loginKey, true);
    await prefs.setString(AppConstants.userEmailKey, email);
    notifyListeners();
    return true;
  }

  void skipLogin() {
    _isLoggedIn = true;
    _userEmail = null;
    prefs.setBool(AppConstants.loginKey, true);
    prefs.remove(AppConstants.userEmailKey);
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _userEmail = null;
    prefs.setBool(AppConstants.loginKey, false);
    prefs.remove(AppConstants.userEmailKey);
    notifyListeners();
  }

  void toggleWishlist(Product product) {
    if (_wishlist.any((item) => item.id == product.id)) {
      _wishlist.removeWhere((item) => item.id == product.id);
    } else {
      _wishlist.add(product);
    }
    prefs.setStringList(
      AppConstants.wishlistKey,
      _wishlist.map((product) => json.encode(product.toJson())).toList(),
    );
    notifyListeners();
  }

  bool isInWishlist(Product product) {
    return _wishlist.any((item) => item.id == product.id);
  }

  void recordProductClick(Product product) {
    addToClickHistory(product);
  }

  void addToClickHistory(Product product) {
    _clickHistory.removeWhere((item) => item.id == product.id);
    _clickHistory.insert(0, product);
    if (_clickHistory.length > 10) {
      _clickHistory = _clickHistory.sublist(0, 10);
    }
    prefs.setStringList(
      AppConstants.clickHistoryKey,
      _clickHistory.map((product) => json.encode(product.toJson())).toList(),
    );
    notifyListeners();
  }

  List<Product> getWishlistProducts() {
    return _wishlist;
  }

  List<Product> getClickedProducts() {
    return _clickHistory;
  }

  void searchProducts(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  void filterByCategory(String? categoryId) {
    _selectedCategory = categoryId;
    _applyFilters();
  }

  void _applyFilters() {
    _isLoading = true;
    notifyListeners();

    _filteredProducts = _allProducts.where((product) {
      bool categoryMatch = _selectedCategory == null || product.category == _selectedCategory;
      bool searchMatch = _searchQuery.isEmpty || 
          product.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          product.description.toLowerCase().contains(_searchQuery.toLowerCase());
      return categoryMatch && searchMatch;
    }).toList();

    _isLoading = false;
    notifyListeners();
  }

  List<Product> getFeaturedProducts() {
    return _allProducts.where((product) => product.discountPercentage > 0).toList();
  }

  List<Product> getTopRatedProducts() {
    List<Product> sortedProducts = List.from(_allProducts);
    sortedProducts.sort((a, b) => b.rating.compareTo(a.rating));
    return sortedProducts.take(5).toList();
  }

  List<Product> getProductsByCategory(String categoryId) {
    return _allProducts.where((product) => product.category == categoryId).toList();
  }

  Product? getProductById(String id) {
    try {
      return _allProducts.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  String getTranslatedText(String key) {
    Map<String, String> translations = AppText.translations[_language] ?? AppText.translations[AppConstants.english]!;
    return translations[key] ?? key;
  }

  Future<void> launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
} 