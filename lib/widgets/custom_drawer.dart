import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state_provider.dart';
import '../utils/app_constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<AppStateProvider>(
        builder: (context, appState, child) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'SHOPPLY',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Version ${AppConstants.appVersion}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  appState.isDarkMode
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),
                title: Text(
                  appState.isDarkMode
                      ? AppText.darkMode[appState.language]!
                      : AppText.lightMode[appState.language]!,
                ),
                trailing: Switch(
                  value: appState.isDarkMode,
                  onChanged: (value) => appState.toggleDarkMode(),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: Text(
                  appState.language == 'en'
                      ? 'Français'
                      : 'English',
                ),
                onTap: () {
                  appState.setLanguage(appState.language == 'en' ? 'fr' : 'en');
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: Text(AppText.about[appState.language]!),
                onTap: () {
                  // TODO: Implement about page
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.help_outline),
                title: Text(AppText.help[appState.language]!),
                onTap: () {
                  // TODO: Implement help page
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      ),
    );
  }
} 