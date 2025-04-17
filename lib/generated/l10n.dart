// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
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

  /// `welcome to our app `
  String get on_boarding_title {
    return Intl.message(
      'welcome to our app ',
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
