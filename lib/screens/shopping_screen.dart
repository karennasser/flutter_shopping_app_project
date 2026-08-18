import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'cart_screen.dart';
import 'product_search_delegate.dart';
import '../cart_manager.dart';

class ShoppingScreen extends StatefulWidget {
  final VoidCallback onLanguageChanged;
  final VoidCallback onThemeChanged;
  final bool isDarkMode;
  const ShoppingScreen({
    super.key,
    required this.onLanguageChanged,
    required this.onThemeChanged,
    required this.isDarkMode,
  });
  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  final PageController _pageController = PageController();

  final List<String> featuredImages = [
    'assets/bag/bag1.jpg',
    'assets/clothes/dress6.jpg',
    'assets/shoes/shoes1.jpg',
  ];

  final List<Map<String, String>> products = [
    {'image': 'assets/clothes/dress1.jpg', 'title': 'dress1'},
    {'image': 'assets/clothes/dress2.jpg', 'title': 'dress2'},
    {'image': 'assets/clothes/dress3.jpg', 'title': 'dress3'},
    {'image': 'assets/clothes/dress4.jpg', 'title': 'dress4'},
    {'image': 'assets/clothes/dress5.jpg', 'title': 'dress5'},
    {'image': 'assets/clothes/dress6.jpg', 'title': 'dress6'},
    {'image': 'assets/clothes/pantes.jpg', 'title': 'pants'},
    {'image': 'assets/clothes/te_shirt.jpg', 'title': 'tshirt1'},
    {'image': 'assets/clothes/te_shirt2.jpg', 'title': 'tshirt2'},
    {'image': 'assets/shoes/shoes1.jpg', 'title': 'shoes1'},
    {'image': 'assets/shoes/shoes2.jpg', 'title': 'shoes2'},
    {'image': 'assets/shoes/shoes3.jpg', 'title': 'shoes3'},
    {'image': 'assets/shoes/shoes4.jpg', 'title': 'shoes4'},
    {'image': 'assets/shoes/shoes7.jpg', 'title': 'shoes7'},
    {'image': 'assets/bag/bag1.jpg', 'title': 'bag1'},
    {'image': 'assets/bag/bag2.jpg', 'title': 'bag2'},
    {'image': 'assets/bag/bag3.jpg', 'title': 'bag3'},
  ];

  final List<Map<String, String>> offers = [
    {'image': 'assets/offers/sale.jpg', 'description': 'specialBagOffer'},
    {'image': 'assets/bag/bag2.jpg', 'description': 'bagDiscount'},
    {'image': 'assets/offers/sale2.jpg', 'description': 'limitedOffer'},
    {'image': 'assets/clothes/dress1.jpg', 'description': 'dressOffer'},
    {'image': 'assets/clothes/dress2.jpg', 'description': 'newCollection'},
  ];

  // Get product name from localization
  String getProductTitle(String key, AppLocalizations text) {
    switch (key) {
      case 'dress1':
        return text.dress1;

      case 'dress2':
        return text.dress2;

      case 'dress3':
        return text.dress3;

      case 'dress4':
        return text.dress4;

      case 'dress5':
        return text.dress5;

      case 'dress6':
        return text.dress6;

      case 'pants':
        return text.pants;

      case 'tshirt1':
        return text.tshirt1;

      case 'tshirt2':
        return text.tshirt2;

      case 'shoes1':
        return text.shoes1;

      case 'shoes2':
        return text.shoes2;

      case 'shoes3':
        return text.shoes3;

      case 'shoes4':
        return text.shoes4;

      case 'shoes7':
        return text.shoes7;

      case 'bag1':
        return text.bag1;

      case 'bag2':
        return text.bag2;

      case 'bag3':
        return text.bag3;

      default:
        return '';
    }
  }

  // Get offer description from localization
  String getOfferDescription(String key, AppLocalizations text) {
    switch (key) {
      case 'specialBagOffer':
        return text.specialBagOffer;

      case 'bagDiscount':
        return text.bagDiscount;

      case 'limitedOffer':
        return text.limitedOffer;

      case 'dressOffer':
        return text.dressOffer;

      case 'newCollection':
        return text.newCollection;

      default:
        return '';
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          text.ourProducts,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,

        actions: [
          // SEARCH
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearchDelegate(
                  products: products,
                  getProductTitle: getProductTitle,
                  text: text,
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),

          //cart
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),

          // LANGUAGE
          IconButton(
            onPressed: widget.onLanguageChanged,
            icon: const Icon(Icons.language),
          ),

          // THEME
          IconButton(
            onPressed: widget.onThemeChanged,
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =========================
            // FEATURED PRODUCTS
            // =========================
            Text(
              text.featuredProducts,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 220,

              child: PageView.builder(
                controller: _pageController,

                // Horizontal flipping
                scrollDirection: Axis.horizontal,

                itemCount: featuredImages.length,

                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),

                      child: Image.asset(
                        featuredImages[index],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // =========================
            // PRODUCTS
            // =========================
            Text(
              text.products,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            GridView.builder(
              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),

              itemCount: products.length,

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,

                // Image + title + cart button
                childAspectRatio: 0.70,
              ),

              itemBuilder: (context, index) {
                final productTitle = getProductTitle(
                  products[index]['title']!,
                  text,
                );

                return Card(
                  elevation: 3,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  clipBehavior: Clip.antiAlias,

                  child: Column(
                    children: [
                      // PRODUCT IMAGE
                      Expanded(
                        child: Image.asset(
                          products[index]['image']!,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // TITLE + CART
                      Padding(
                        padding: const EdgeInsets.all(8),

                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                productTitle,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                            IconButton(
                              icon: const Icon(
                                Icons.add_shopping_cart,
                                color: Colors.pink,
                              ),

                              onPressed: () {
                                CartManager.addToCart(products[index]);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(text.itemAddedToCart)),
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
            ),

            const SizedBox(height: 30),

            // =========================
            // HOT OFFERS
            // =========================
            Text(
              text.hotOffers,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 450,

              child: ListView.builder(
                itemCount: offers.length,

                itemBuilder: (context, index) {
                  final description = getOfferDescription(
                    offers[index]['description']!,
                    text,
                  );

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),

                    elevation: 2,

                    child: SizedBox(
                      height: 90,

                      child: Row(
                        children: [
                          // OFFER IMAGE
                          ClipRRect(
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(4),
                            ),

                            child: Image.asset(
                              offers[index]['image']!,
                              width: 110,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 12),

                          // OFFER DESCRIPTION
                          Expanded(
                            child: Text(
                              description,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
