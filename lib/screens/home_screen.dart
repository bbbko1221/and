import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state_provider.dart';
import '../widgets/custom_app_bar.dart';
import '../utils/app_constants.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import '../utils/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Consumer<AppStateProvider>(
        builder: (context, appState, child) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                // Top Deals Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Top Deals',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 280,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: appState.getFeaturedProducts().length,
                    itemBuilder: (context, index) {
                      final product = appState.getFeaturedProducts()[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: SizedBox(
                          width: 200,
                          child: ProductCard(
                            product: product,
                            onTap: () {
                              appState.recordProductClick(product);
                              Navigator.pushNamed(
                                context,
                                AppConstants.productDetailsRoute,
                                arguments: product.id,
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),

                // Categories
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    appState.getTranslatedText('categories'),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: appState.categories.length,
                    itemBuilder: (context, index) {
                      final category = appState.categories[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: InkWell(
                          onTap: () {
                            appState.filterByCategory(category.id);
                            Navigator.pushNamed(context, AppConstants.searchRoute);
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  IconData(
                                    _getCategoryIcon(category.id),
                                    fontFamily: 'MaterialIcons',
                                  ),
                                  size: 32,
                                  color: AppTheme.primaryColor,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  appState.getTranslatedText(category.id),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),

                // Trending Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Trending',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemCount: appState.getTopRatedProducts().length,
                  itemBuilder: (context, index) {
                    final product = appState.getTopRatedProducts()[index];
                    return ProductCard(
                      product: product,
                      onTap: () {
                        appState.recordProductClick(product);
                        Navigator.pushNamed(
                          context,
                          AppConstants.productDetailsRoute,
                          arguments: product.id,
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
      ),
    );
  }

  int _getCategoryIcon(String categoryId) {
    switch (categoryId) {
      case 'electronics':
        return Icons.devices.codePoint;
      case 'fashion':
        return Icons.shopping_bag.codePoint;
      case 'home_living':
        return Icons.home.codePoint;
      case 'beauty':
        return Icons.spa.codePoint;
      default:
        return Icons.category.codePoint;
    }
  }
} 