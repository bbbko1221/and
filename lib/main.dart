import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'providers/app_state_provider.dart';
import 'utils/theme.dart';
import 'utils/app_constants.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/product_details_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/search_screen.dart';
import 'screens/wishlist_screen.dart';
import 'screens/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppStateProvider(prefs),
      child: Consumer<AppStateProvider>(
        builder: (context, appState, _) {
          return MaterialApp(
            title: AppConstants.appName,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            initialRoute: appState.isLoggedIn ? AppConstants.homeRoute : AppConstants.loginRoute,
            routes: {
              AppConstants.loginRoute: (context) => const LoginScreen(),
              AppConstants.homeRoute: (context) => const HomeScreen(),
              AppConstants.productDetailsRoute: (context) => const ProductDetailsScreen(),
              AppConstants.profileRoute: (context) => const ProfileScreen(),
              AppConstants.searchRoute: (context) => const SearchScreen(),
              AppConstants.wishlistRoute: (context) => const WishlistScreen(),
              AppConstants.settingsRoute: (context) => const SettingsScreen(),
            },
          );
        },
      ),
    );
  }
}
