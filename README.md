#  Flutter Shopping App

A modern and responsive shopping application built with **Flutter and Dart**.
This project demonstrates core Dart programming concepts, Flutter UI development, form validation, navigation, animations, product browsing, cart interactions, and Arabic localization.

---

## Project Overview

The **Flutter Shopping App** simulates a real-world shopping experience where users can:

* Explore featured products
* Browse products in a responsive grid
* Add products to the cart
* View hot offers
* Create an account
* Sign in to the application
* Switch between English and Arabic
* Navigate between screens with smooth animations

The project was developed as part of a Flutter development assignment that progresses from basic Dart programming concepts to an intermediate-level Flutter application.

---

##  Features

###  Welcome Screen

The welcome screen provides an attractive introduction to the application.

Features include:

* Custom AppBar
* Local image
* Online image
* Custom **Suwannaphum-Regular** font
* Centered layout
* Custom font sizes and styling
* **Sign Up** button
* **Sign In** button

Users can choose whether to create a new account or sign in.

---

###  Sign Up

Users can create an account using a validated registration form.

The form includes:

* Full Name
* Email
* Password
* Confirm Password

Validation rules:

* Full Name must start with an uppercase letter
* Email must contain `@`
* Password must contain at least 6 characters
* Confirm Password must match the password

After successful registration, the application displays:

> Account created successfully

The user can then continue to the shopping screen.

---

###  Sign In

Existing users can sign in using:

* Email
* Password

Validation includes:

* Email must contain `@`
* Password must contain at least 6 characters

After successful sign-in, the application displays:

> Account sign-in successfully

The user can then access the main shopping screen.

---

###  Animated Navigation

The application includes a smooth transition between authentication and the shopping screen.

After signing up:

* The Sign-Up page fades out
* The Shopping Home page fades in

This creates a smoother user experience.

---

###  Shopping Home

The main shopping screen contains:

* AppBar titled **Our Products**
* Featured products using a horizontal `PageView`
* Responsive product `GridView`
* Two products per row
* Product images
* Product titles
* Add to Cart buttons
* SnackBar feedback when adding products

When a product is added to the cart, the application displays:

> Item added to the cart

The home screen also contains a **Hot Offers** section with five vertically scrollable offers.

---
##Product Search

The application includes a search bar that allows users to quickly find products.

Users can:

Search for products by name
Filter the displayed products based on the search query
Easily access the search functionality from the shopping screen

This makes browsing through the available products faster and easier.
---
##Shopping Cart

The application includes a shopping cart for managing selected products.

Users can:

Add products to the cart
View products added to the cart
Open the cart from the shopping screen
Manage their selected products

When a product is added, the application displays a SnackBar confirming:

Item added to the cart
---
##Theme Support

The application supports Light Mode and Dark Mode.

Users can switch between themes using the theme button.

The selected theme is applied throughout the application, providing a more comfortable experience in different lighting conditions.
---
###  Hot Offers

The Hot Offers section uses `ListView.builder`.

Each offer contains:

* Product/offer image
* Offer description
* Responsive layout using `Expanded`

There are five vertically scrollable offers.

---

###  Arabic Localization

The application supports **English and Arabic** localization.

Examples include:

| English      | Arabic         |
| ------------ | -------------- |
| Our Products | منتجاتنا       |
| Hot Offers   | العروض الساخنة |

The application also supports Arabic translations for sign-up fields and messages.

Localization is implemented using:

* `.arb` files
* Flutter localization
* `intl`
* No hardcoded UI strings

---

## 🛠️ Technologies Used

* **Dart** — Application logic and object-oriented programming
* **Flutter** — User interface and application development
* **Flutter Intl** — Localization
* **Git & GitHub** — Version control and project hosting
* **VS Code / Android Studio** — Development environment

---

##  Project Structure

The project follows a modular structure where widgets and classes are separated into individual files.

```text
lib/
│
├── l10n/
│   ├── app_en.arb
│   └── app_ar.arb
│
├── screens/
│   ├── welcome_screen.dart
│   ├── sign_up_screen.dart
│   ├── sign_in_screen.dart
│   ├── shopping_screen.dart
│   └── cart_screen.dart
│
├── widgets/
│   └── ...
│
├── main.dart
└── cart_manager.dart

assets/
│
├── welcome/
├── clothes/
├── bag/
├── offers/
└── shoes/
```

The project follows the assignment's code-quality requirements, including separate files for widgets/classes, meaningful names, clean formatting, and avoiding duplicated or unused code.

---

##  Getting Started

### Prerequisites

Make sure you have installed:

* Flutter SDK
* Dart SDK
* Android Studio or VS Code
* Android Emulator or a physical device
* Git

### 1. Clone the Repository

```bash
git clone YOUR_GITHUB_REPOSITORY_URL
```

### 2. Open the Project

```bash
cd YOUR_PROJECT_FOLDER
```

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Check Flutter Installation

```bash
flutter doctor
```

### 5. Run the Application

```bash
flutter run
```
##  Project Objectives

The main objectives of this project are to:

* Build a complete shopping application using Flutter and Dart
* Practice Dart variables, constants, functions, control flow, lists, maps, and OOP
* Build interfaces using Stateless and Stateful widgets
* Implement form validation
* Implement navigation and animations
* Add Arabic localization
* Follow clean project structure and coding practices
* Publish the project on GitHub with proper documentation and screenshots

---

##  Code Quality

The project follows these practices:

* Modular file structure
* Separate widgets/classes
* Meaningful variable and function names
* Clean and formatted code
* No unnecessary duplicated code
* No unused code
* Reusable Flutter widgets
* Localization instead of hardcoded UI strings

---

##  What I Learned

Through this project, I practiced:

* Dart fundamentals
* Object-Oriented Programming
* Flutter widgets
* Stateful and Stateless widgets
* Form validation
* Navigation
* PageView
* GridView
* ListView.builder
* SnackBars
* Dialogs
* Animations
* Asset management
* Custom fonts
* Localization
* Arabic language support
* Git and GitHub

---

##  Reference

Project UI inspiration:

`https://aesthetic-flow-shop-intro.lovable.app/`

The assignment specifies using GitHub for publishing the project and including a README containing the project overview, features, setup instructions, screenshots, and clean code structure.

---

##  Author

**Karen Nasser**

Flutter & Dart Project

---
