import 'package:flutter/material.dart';
import 'package:flutter_shopping_app_project/screens/shopping_screen.dart';
import 'package:flutter_shopping_app_project/screens/sign_up_screen.dart';

import '../l10n/app_localizations.dart';

class SignInScreen extends StatefulWidget {
  final VoidCallback onLanguageChanged;
  final VoidCallback onThemeChanged;
  final bool isDarkMode;
  const SignInScreen({
    super.key,
    required this.onLanguageChanged,
    required this.onThemeChanged,
    required this.isDarkMode,
  });
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      final text = AppLocalizations.of(context)!;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(text.ok),
            content: Text(text.accountSignedIn),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return ShoppingScreen(
                          onLanguageChanged: widget.onLanguageChanged,
                          onThemeChanged: widget.onThemeChanged,
                          isDarkMode: widget.isDarkMode,
                        );
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                      transitionDuration: const Duration(milliseconds: 800),
                    ),
                  );
                },
                child: Text(text.close),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(text.signIn),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,

        actions: [
          IconButton(
            onPressed: widget.onLanguageChanged,
            icon: const Icon(Icons.language),
          ),

          IconButton(
            onPressed: widget.onThemeChanged,
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            children: [
              const SizedBox(height: 30),

              Text(
                text.welcomeBack,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Suwannaphum',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                text.signInSubtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Suwannaphum',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 40),

              // EMAIL
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                  labelText: text.email,
                  prefixIcon: const Icon(Icons.email),
                  border: const OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return text.pleaseEnterEmail;
                  }

                  if (!value.contains('@')) {
                    return text.emailMustIncludeAt;
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              // PASSWORD
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,

                decoration: InputDecoration(
                  labelText: text.password,
                  prefixIcon: const Icon(Icons.lock),
                  border: const OutlineInputBorder(),

                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),

                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return text.pleaseEnterPassword;
                  }

                  if (value.length < 6) {
                    return text.passwordMinimum;
                  }

                  return null;
                },
              ),

              const SizedBox(height: 30),

              // SIGN IN BUTTON
              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  onPressed: _signIn,

                  child: Text(
                    text.signIn,
                    style: const TextStyle(
                      fontFamily: 'Suwannaphum',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // SIGN UP LINK
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    text.dontHaveAccount,
                    style: const TextStyle(fontFamily: 'Suwannaphum'),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
