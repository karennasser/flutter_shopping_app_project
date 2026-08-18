import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class ProductSearchDelegate extends SearchDelegate<String> {
  final List<Map<String, String>> products;

  final String Function(
    String key,
    AppLocalizations text,
  ) getProductTitle;

  final AppLocalizations text;

  ProductSearchDelegate({
    required this.products,
    required this.getProductTitle,
    required this.text,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear),
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildProducts();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildProducts();
  }

  Widget _buildProducts() {
    final results = products.where((product) {
      final title = getProductTitle(
        product['title']!,
        text,
      );

      return title.toLowerCase().contains(
            query.toLowerCase(),
          );
    }).toList();

    if (results.isEmpty) {
      return const Center(
        child: Text(
          'No products found',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: results.length,

      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.70,
      ),

      itemBuilder: (context, index) {
        final product = results[index];

        final title = getProductTitle(
          product['title']!,
          text,
        );

        return Card(
          elevation: 3,

          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  product['image']!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),

                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}