// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Skip`
  String get on_boarding_skip {
    return Intl.message('Skip', name: 'on_boarding_skip', desc: '', args: []);
  }

  /// `welcome to   `
  String get on_boarding_title {
    return Intl.message(
      'welcome to   ',
      name: 'on_boarding_title',
      desc: '',
      args: [],
    );
  }

  /// `Discover a unique shopping experience with FruitHUB. Explore our wide selection of premium fresh fruits and enjoy the best offers with top quality.`
  String get on_boarding_subtitle {
    return Intl.message(
      'Discover a unique shopping experience with FruitHUB. Explore our wide selection of premium fresh fruits and enjoy the best offers with top quality.',
      name: 'on_boarding_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Browse and Shop `
  String get on_boarding_title2 {
    return Intl.message(
      'Browse and Shop ',
      name: 'on_boarding_title2',
      desc: '',
      args: [],
    );
  }

  /// `We offer you the finest handpicked fruits. Check details, photos, and reviews to ensure you select the perfect fruit.`
  String get on_boarding_subtitle2 {
    return Intl.message(
      'We offer you the finest handpicked fruits. Check details, photos, and reviews to ensure you select the perfect fruit.',
      name: 'on_boarding_subtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Start now`
  String get on_boarding_buttom_text {
    return Intl.message(
      'Start now',
      name: 'on_boarding_buttom_text',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get on_Login_email {
    return Intl.message('Email', name: 'on_Login_email', desc: '', args: []);
  }

  /// `Password`
  String get on_Login_password {
    return Intl.message(
      'Password',
      name: 'on_Login_password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get on_Login_forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'on_Login_forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get on_Login_login {
    return Intl.message('Login', name: 'on_Login_login', desc: '', args: []);
  }

  /// `Create Account`
  String get on_Login_create_account {
    return Intl.message(
      'Create Account',
      name: 'on_Login_create_account',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get on_Login_create_account_text {
    return Intl.message(
      'Don\'t have an account?',
      name: 'on_Login_create_account_text',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get on_Login_login_or_divider {
    return Intl.message(
      'or',
      name: 'on_Login_login_or_divider',
      desc: '',
      args: [],
    );
  }

  /// `Login with Google`
  String get on_Login_login_with_google {
    return Intl.message(
      'Login with Google',
      name: 'on_Login_login_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Login with Facebook`
  String get on_Login_login_with_facebook {
    return Intl.message(
      'Login with Facebook',
      name: 'on_Login_login_with_facebook',
      desc: '',
      args: [],
    );
  }

  /// `Login with Apple`
  String get on_Login_login_with_apple {
    return Intl.message(
      'Login with Apple',
      name: 'on_Login_login_with_apple',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get on_signup_Signup {
    return Intl.message(
      'Sign Up',
      name: 'on_signup_Signup',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get on_signup_name {
    return Intl.message('Name', name: 'on_signup_name', desc: '', args: []);
  }

  /// `Email`
  String get on_signup_email {
    return Intl.message('Email', name: 'on_signup_email', desc: '', args: []);
  }

  /// `Password`
  String get on_signup_password {
    return Intl.message(
      'Password',
      name: 'on_signup_password',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to `
  String get on_signup_TermsandConditions {
    return Intl.message(
      'By creating an account, you agree to ',
      name: 'on_signup_TermsandConditions',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get on_signup_TermsandConditions_text {
    return Intl.message(
      'Terms and Conditions',
      name: 'on_signup_TermsandConditions_text',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get on_signup_TermsandConditions_text2 {
    return Intl.message(
      'and',
      name: 'on_signup_TermsandConditions_text2',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get on_signup_TermsandConditions_text3 {
    return Intl.message(
      'Privacy Policy',
      name: 'on_signup_TermsandConditions_text3',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get on_signup_create_NewAccount {
    return Intl.message(
      'Create New Account',
      name: 'on_signup_create_NewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get on_signup_create_NewAccount_text {
    return Intl.message(
      'Already have an account?',
      name: 'on_signup_create_NewAccount_text',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get on_signup_create_NewAccount_text2 {
    return Intl.message(
      'Login',
      name: 'on_signup_create_NewAccount_text2',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in all fields`
  String get on_signup_Text_feils {
    return Intl.message(
      'Please fill in all fields',
      name: 'on_signup_Text_feils',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get Custom_Exception_weak_password {
    return Intl.message(
      'The password provided is too weak.',
      name: 'Custom_Exception_weak_password',
      desc: '',
      args: [],
    );
  }

  /// `The email address is already in use by another account.`
  String get Custom_Exception_email_already_in_use {
    return Intl.message(
      'The email address is already in use by another account.',
      name: 'Custom_Exception_email_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred please try again later.`
  String get Custom_Exception_unknown {
    return Intl.message(
      'An unknown error occurred please try again later.',
      name: 'Custom_Exception_unknown',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
