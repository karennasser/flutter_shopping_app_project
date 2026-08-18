import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/app_localizations.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  // false = Light Mode
  // true = Dark Mode
  bool _isDarkMode = false;

  // =========================
  // CHANGE LANGUAGE
  // =========================
  void _changeLanguage() {
    setState(() {
      _locale = _locale.languageCode == 'en'
          ? const Locale('ar')
          : const Locale('en');
    });
  }

  // =========================
  // CHANGE THEME
  // =========================
  void _changeTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // LANGUAGE
      locale: _locale,

      // THEME
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Suwannaphum',
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
      ),

      // DARK THEME
      darkTheme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Suwannaphum',
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),

      themeMode: _isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,

      // LOCALIZATION
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],

      home: WelcomeScreen(
        onLanguageChanged: _changeLanguage,
        onThemeChanged: _changeTheme,
        isDarkMode: _isDarkMode,
      ),
    );
  }
}