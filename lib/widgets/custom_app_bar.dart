import 'package:flutter/material.dart';
import '../utils/text_styles.dart';
import '../utils/app_constants.dart';
import '../utils/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 56, // Reduced height
      title: Text(
        AppConstants.appName,
        style: ModernTextStyles.appTitle,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => Navigator.pushNamed(context, AppConstants.searchRoute),
          splashRadius: 24, // Add ripple effect
        ),
        IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () => Navigator.pushNamed(context, AppConstants.wishlistRoute),
          splashRadius: 24,
        ),
        IconButton(
          icon: const Icon(Icons.person_outline),
          onPressed: () => Navigator.pushNamed(context, AppConstants.profileRoute),
          splashRadius: 24,
        ),
      ],
      elevation: 0,
      centerTitle: false, // Align title to left
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppTheme.darkSurfaceColor
          : Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
} 