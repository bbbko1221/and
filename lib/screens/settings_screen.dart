import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_state_provider.dart';
import '../utils/theme.dart';
import '../utils/app_constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
      builder: (context, appState, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(appState.getTranslatedText('settings')),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // App Info Section
              Card(
                margin: EdgeInsets.zero,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.info_outline),
                      title: const Text(AppConstants.appName),
                      subtitle: Text('Version ${AppConstants.appVersion}'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Preferences Section
              Text(
                'Preferences',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Card(
                margin: EdgeInsets.zero,
                child: Column(
                  children: [
                    // Theme Toggle
                    ListTile(
                      leading: const Icon(Icons.dark_mode),
                      title: Text(appState.getTranslatedText('darkMode')),
                      trailing: Switch(
                        value: appState.isDarkMode,
                        onChanged: (value) => appState.toggleDarkMode(),
                        activeColor: AppTheme.primaryColor,
                      ),
                    ),
                    const Divider(height: 1),

                    // Language Selection
                    ListTile(
                      leading: const Icon(Icons.language),
                      title: Text(appState.getTranslatedText('language')),
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

                    // Notifications
                    ListTile(
                      leading: const Icon(Icons.notifications_outlined),
                      title: Text(appState.getTranslatedText('notifications')),
                      trailing: Switch(
                        value: false, // TODO: Implement notifications
                        onChanged: (value) {
                          // TODO: Implement notifications toggle
                        },
                        activeColor: AppTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Data Management Section
              Text(
                'Data Management',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Card(
                margin: EdgeInsets.zero,
                child: Column(
                  children: [
                    // Clear Wishlist
                    ListTile(
                      leading: const Icon(Icons.favorite_border),
                      title: const Text('Clear Wishlist'),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Clear Wishlist'),
                            content: const Text(
                              'Are you sure you want to clear your wishlist? This action cannot be undone.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // TODO: Implement clear wishlist
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Clear',
                                  style: TextStyle(
                                    color: AppTheme.errorColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const Divider(height: 1),

                    // Clear Click History
                    ListTile(
                      leading: const Icon(Icons.history),
                      title: const Text('Clear Click History'),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Clear Click History'),
                            content: const Text(
                              'Are you sure you want to clear your click history? This action cannot be undone.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // TODO: Implement clear click history
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Clear',
                                  style: TextStyle(
                                    color: AppTheme.errorColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
} 