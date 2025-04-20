import '../utils/app_constants.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final List<String> images;
  final String category;
  final String affiliateUrl;
  final List<String> specifications;
  final List<Review> reviews;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.images,
    required this.category,
    required this.affiliateUrl,
    required this.specifications,
    required this.reviews,
  });

  // Calculate discounted price
  double get discountedPrice {
    if (hasDiscount) {
      return price - (price * (discountPercentage / 100));
    }
    return price;
  }

  // Check if product has discount
  bool get hasDiscount => discountPercentage > 0;

  List<String> get fullImageUrls {
    return images.map((image) => '${AppConstants.imageBaseUrl}$image').toList();
  }

  // Factory constructor to create Product from JSON map
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      category: json['category'] as String,
      affiliateUrl: json['affiliateUrl'] as String,
      specifications: (json['specifications'] as List<dynamic>).map((e) => e as String).toList(),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  // Convert Product to JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'images': images,
      'category': category,
      'affiliateUrl': affiliateUrl,
      'specifications': specifications,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}

class Review {
  final String username;
  final double rating;
  final String comment;
  final String date;

  Review({
    required this.username,
    required this.rating,
    required this.comment,
    required this.date,
  });

  // Factory constructor to create Review from JSON map
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      username: json['username'],
      rating: json['rating'].toDouble(),
      comment: json['comment'],
      date: json['date'],
    );
  }

  // Convert Review to JSON map
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'rating': rating,
      'comment': comment,
      'date': date,
    };
  }
}

class Category {
  final String id;
  final String name;
  final dynamic icon;

  Category({
    required this.id,
    required this.name,
    required this.icon,
  });

  // Factory constructor to create Category from JSON map
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
    );
  }

  // Convert Category to JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
    };
  }
} 