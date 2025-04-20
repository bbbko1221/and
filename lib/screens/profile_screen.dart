import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state_provider.dart';
import '../utils/text_styles.dart';
import '../utils/app_constants.dart';
import '../utils/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
      builder: (context, appState, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Profile', style: ModernTextStyles.appTitle),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Section
                Card(
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Icon(
                                appState.isLoggedIn ? Icons.person : Icons.person_outline,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    appState.isLoggedIn
                                        ? (appState.userEmail ?? 'User')
                                        : 'Guest User',
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(height: 4),
                                  TextButton(
                                    onPressed: () {
                                      if (appState.isLoggedIn) {
                                        appState.logout();
                                      }
                                      Navigator.pushReplacementNamed(
                                        context,
                                        AppConstants.loginRoute,
                                      );
                                    },
                                    child: Text(
                                      appState.isLoggedIn ? 'Logout' : 'Login',
                                      style: TextStyle(
                                        color: AppTheme.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Settings Section
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Card(
                  margin: EdgeInsets.zero,
                  child: Column(
                    children: [
                      // Dark Mode Toggle
                      ListTile(
                        leading: const Icon(Icons.dark_mode),
                        title: const Text('Dark Mode'),
                        trailing: Switch(
                          value: appState.isDarkMode,
                          onChanged: (_) => appState.toggleDarkMode(),
                          activeColor: AppTheme.primaryColor,
                          activeTrackColor: AppTheme.primaryColor.withOpacity(0.5),
                        ),
                      ),
                      const Divider(height: 1),

                      // Language Selection
                      ListTile(
                        leading: const Icon(Icons.language),
                        title: const Text('Language'),
                        trailing: DropdownButton<String>(
                          value: appState.language,
                          items: [
                            DropdownMenuItem(
                              value: AppConstants.english,
                              child: Text(appState.getTranslatedText('english')),
                            ),
                            DropdownMenuItem(
                              value: AppConstants.french,
                              child: Text(appState.getTranslatedText('french')),
                            ),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              appState.setLanguage(value);
                            }
                          },
                          underline: const SizedBox(),
                        ),
                      ),
                      const Divider(height: 1),

                      // Wishlist
                      ListTile(
                        leading: const Icon(Icons.favorite_border),
                        title: const Text('Wishlist'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppConstants.wishlistRoute,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Click History Section
                Text(
                  'Click History',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                if (appState.clickHistory.isEmpty)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('No products clicked yet'),
                    ),
                  )
                else
                  Card(
                    margin: EdgeInsets.zero,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: appState.clickHistory.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final product = appState.clickHistory[index];
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              product.images.first,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                width: 50,
                                height: 50,
                                color: Colors.grey[300],
                                child: const Icon(Icons.error),
                              ),
                            ),
                          ),
                          title: Text(
                            product.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          trailing: TextButton(
                            onPressed: () => appState.launchURL(product.affiliateUrl),
                            style: TextButton.styleFrom(
                              foregroundColor: AppTheme.primaryColor,
                            ),
                            child: const Text('Visit'),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppConstants.productDetailsRoute,
                              arguments: product.id,
                            );
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
} 