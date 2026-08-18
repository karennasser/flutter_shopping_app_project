import 'package:flutter/material.dart';
import 'package:flutter_shopping_app_project/screens/sign_in_screen.dart';
import 'package:flutter_shopping_app_project/screens/sign_up_screen.dart';
import '../l10n/app_localizations.dart';

class WelcomeScreen extends StatefulWidget {
  final VoidCallback onLanguageChanged;
  final VoidCallback onThemeChanged;
  final bool isDarkMode;

  const WelcomeScreen({
    super.key,
    required this.onLanguageChanged,
    required this.onThemeChanged,
    required this.isDarkMode,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          text.appTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        centerTitle: true,

        actions: [
          IconButton(
            onPressed: widget.onLanguageChanged,
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text.welcome,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Suwannaphum',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/welcome/welcom_main.jpg',
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 20),

                  Image.network(
                    'https://images.unsplash.com/photo-1472851294608-062f824d29cc?w=500',
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(
                          onLanguageChanged: widget.onLanguageChanged,
                          onThemeChanged: widget.onThemeChanged,
                          isDarkMode: widget.isDarkMode,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    text.signUp,
                    style: const TextStyle(
                      fontFamily: 'Suwannaphum',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(
                          onLanguageChanged: widget.onLanguageChanged,
                          onThemeChanged: widget.onThemeChanged,
                          isDarkMode: widget.isDarkMode,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    text.signIn,
                    style: const TextStyle(
                      fontFamily: 'Suwannaphum',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
