import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Shopping App'**
  String get appTitle;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Our Shop'**
  String get welcome;

  /// No description provided for @ourProducts.
  ///
  /// In en, this message translates to:
  /// **'Our Products'**
  String get ourProducts;

  /// No description provided for @featuredProducts.
  ///
  /// In en, this message translates to:
  /// **'Featured Products'**
  String get featuredProducts;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @hotOffers.
  ///
  /// In en, this message translates to:
  /// **'Hot Offers'**
  String get hotOffers;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @accountCreated.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get accountCreated;

  /// No description provided for @accountSignedIn.
  ///
  /// In en, this message translates to:
  /// **'Account sign-in successfully'**
  String get accountSignedIn;

  /// No description provided for @pleaseEnterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your full name'**
  String get pleaseEnterName;

  /// No description provided for @firstLetterUppercase.
  ///
  /// In en, this message translates to:
  /// **'First letter must be uppercase'**
  String get firstLetterUppercase;

  /// No description provided for @pleaseEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get pleaseEnterEmail;

  /// No description provided for @emailMustIncludeAt.
  ///
  /// In en, this message translates to:
  /// **'Email must include @'**
  String get emailMustIncludeAt;

  /// No description provided for @pleaseEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get pleaseEnterPassword;

  /// No description provided for @passwordMinimum.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMinimum;

  /// No description provided for @pleaseConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get pleaseConfirmPassword;

  /// No description provided for @passwordsNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsNotMatch;

  /// No description provided for @itemAddedToCart.
  ///
  /// In en, this message translates to:
  /// **'Item added to the cart'**
  String get itemAddedToCart;

  /// No description provided for @dress1.
  ///
  /// In en, this message translates to:
  /// **'Dress 1'**
  String get dress1;

  /// No description provided for @dress2.
  ///
  /// In en, this message translates to:
  /// **'Dress 2'**
  String get dress2;

  /// No description provided for @dress3.
  ///
  /// In en, this message translates to:
  /// **'Dress 3'**
  String get dress3;

  /// No description provided for @dress4.
  ///
  /// In en, this message translates to:
  /// **'Dress 4'**
  String get dress4;

  /// No description provided for @dress5.
  ///
  /// In en, this message translates to:
  /// **'Dress 5'**
  String get dress5;

  /// No description provided for @dress6.
  ///
  /// In en, this message translates to:
  /// **'Dress 6'**
  String get dress6;

  /// No description provided for @pants.
  ///
  /// In en, this message translates to:
  /// **'Pants'**
  String get pants;

  /// No description provided for @tshirt1.
  ///
  /// In en, this message translates to:
  /// **'T-Shirt'**
  String get tshirt1;

  /// No description provided for @tshirt2.
  ///
  /// In en, this message translates to:
  /// **'T-Shirt 2'**
  String get tshirt2;

  /// No description provided for @shoes1.
  ///
  /// In en, this message translates to:
  /// **'Shoes 1'**
  String get shoes1;

  /// No description provided for @shoes2.
  ///
  /// In en, this message translates to:
  /// **'Shoes 2'**
  String get shoes2;

  /// No description provided for @shoes3.
  ///
  /// In en, this message translates to:
  /// **'Shoes 3'**
  String get shoes3;

  /// No description provided for @shoes4.
  ///
  /// In en, this message translates to:
  /// **'Shoes 4'**
  String get shoes4;

  /// No description provided for @shoes7.
  ///
  /// In en, this message translates to:
  /// **'Shoes 7'**
  String get shoes7;

  /// No description provided for @bag1.
  ///
  /// In en, this message translates to:
  /// **'Bag 1'**
  String get bag1;

  /// No description provided for @bag2.
  ///
  /// In en, this message translates to:
  /// **'Bag 2'**
  String get bag2;

  /// No description provided for @bag3.
  ///
  /// In en, this message translates to:
  /// **'Bag 3'**
  String get bag3;

  /// No description provided for @specialBagOffer.
  ///
  /// In en, this message translates to:
  /// **'Special offer on our latest bags!'**
  String get specialBagOffer;

  /// No description provided for @bagDiscount.
  ///
  /// In en, this message translates to:
  /// **'Get amazing discounts on selected bags.'**
  String get bagDiscount;

  /// No description provided for @limitedOffer.
  ///
  /// In en, this message translates to:
  /// **'Limited time offer. Shop now!'**
  String get limitedOffer;

  /// No description provided for @dressOffer.
  ///
  /// In en, this message translates to:
  /// **'Beautiful dresses at special prices.'**
  String get dressOffer;

  /// No description provided for @newCollection.
  ///
  /// In en, this message translates to:
  /// **'Discover our new fashion collection.'**
  String get newCollection;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeBack;

  /// No description provided for @signInSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue shopping'**
  String get signInSubtitle;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
