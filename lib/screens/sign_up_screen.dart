import 'package:flutter/material.dart';
import 'package:flutter_shopping_app_project/screens/sign_in_screen.dart';
import 'shopping_screen.dart';
import '../l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback onLanguageChanged;
  final VoidCallback onThemeChanged;
  final bool isDarkMode;
  const SignUpScreen({
    super.key,
    required this.onLanguageChanged,
    required this.onThemeChanged,
    required this.isDarkMode,
  });
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      final text = AppLocalizations.of(context)!;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(text.ok),
            content: Text(text.accountCreated),
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
        title: Text(text.signUp),
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
              const SizedBox(height: 20),

              Text(
                text.signUp,
                style: const TextStyle(
                  fontFamily: 'Suwannaphum',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              // FULL NAME
              TextFormField(
                controller: _nameController,

                decoration: InputDecoration(
                  labelText: text.fullName,
                  prefixIcon: const Icon(Icons.person),
                  border: const OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return text.pleaseEnterName;
                  }

                  final name = value.trim();

                  if (name.length < 3) {
                    return text.pleaseEnterName;
                  }

                  if (name[0] != name[0].toUpperCase()) {
                    return text.firstLetterUppercase;
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

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

              const SizedBox(height: 20),

              // CONFIRM PASSWORD
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,

                decoration: InputDecoration(
                  labelText: text.confirmPassword,
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: const OutlineInputBorder(),

                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),

                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return text.pleaseConfirmPassword;
                  }

                  if (value != _passwordController.text) {
                    return text.passwordsNotMatch;
                  }

                  return null;
                },
              ),

              const SizedBox(height: 30),

              // SIGN UP BUTTON
              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  onPressed: _signUp,

                  child: Text(
                    text.signUp,
                    style: const TextStyle(
                      fontFamily: 'Suwannaphum',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // SIGN IN
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
