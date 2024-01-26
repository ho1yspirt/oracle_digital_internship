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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Discover`
  String get discover {
    return Intl.message(
      'Discover',
      name: 'discover',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Chats`
  String get chats {
    return Intl.message(
      'Chats',
      name: 'chats',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get action_login {
    return Intl.message(
      'Log In',
      name: 'action_login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get action_register {
    return Intl.message(
      'Register',
      name: 'action_register',
      desc: '',
      args: [],
    );
  }

  /// `Pawel Czerwinski`
  String get bg_creator_name {
    return Intl.message(
      'Pawel Czerwinski',
      name: 'bg_creator_name',
      desc: '',
      args: [],
    );
  }

  /// `@pawel_czerwinski`
  String get bg_creator_nick {
    return Intl.message(
      '@pawel_czerwinski',
      name: 'bg_creator_nick',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get action_next {
    return Intl.message(
      'Next',
      name: 'action_next',
      desc: '',
      args: [],
    );
  }

  /// `Field must not be empty`
  String get error_empty {
    return Intl.message(
      'Field must not be empty',
      name: 'error_empty',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get login {
    return Intl.message(
      'Log in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get hint_password {
    return Intl.message(
      'password',
      name: 'hint_password',
      desc: '',
      args: [],
    );
  }

  /// `example@example.example`
  String get hint_email {
    return Intl.message(
      'example@example.example',
      name: 'hint_email',
      desc: '',
      args: [],
    );
  }

  /// `nickname`
  String get hint_nick {
    return Intl.message(
      'nickname',
      name: 'hint_nick',
      desc: '',
      args: [],
    );
  }

  /// `Password is weak`
  String get error_weak_password {
    return Intl.message(
      'Password is weak',
      name: 'error_weak_password',
      desc: '',
      args: [],
    );
  }

  /// `Wrong email type`
  String get error_wrong_email {
    return Intl.message(
      'Wrong email type',
      name: 'error_wrong_email',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get action_signup {
    return Intl.message(
      'Sign Up',
      name: 'action_signup',
      desc: '',
      args: [],
    );
  }

  /// `By signing up, you agree to Photo’s`
  String get terms_and_policy {
    return Intl.message(
      'By signing up, you agree to Photo’s',
      name: 'terms_and_policy',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get terms_of_service {
    return Intl.message(
      'Terms of Service',
      name: 'terms_of_service',
      desc: '',
      args: [],
    );
  }

  /// `And`
  String get and {
    return Intl.message(
      'And',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy.`
  String get privac_policy {
    return Intl.message(
      'Privacy Policy.',
      name: 'privac_policy',
      desc: '',
      args: [],
    );
  }

  /// `What’s new today`
  String get whats_new_today {
    return Intl.message(
      'What’s new today',
      name: 'whats_new_today',
      desc: '',
      args: [],
    );
  }

  /// `Browse all`
  String get browese_all {
    return Intl.message(
      'Browse all',
      name: 'browese_all',
      desc: '',
      args: [],
    );
  }

  /// `See More`
  String get action_see_more {
    return Intl.message(
      'See More',
      name: 'action_see_more',
      desc: '',
      args: [],
    );
  }

  /// `Search all photos`
  String get hint_search {
    return Intl.message(
      'Search all photos',
      name: 'hint_search',
      desc: '',
      args: [],
    );
  }

  /// `all results`
  String get all_results {
    return Intl.message(
      'all results',
      name: 'all_results',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get action_follow {
    return Intl.message(
      'Follow',
      name: 'action_follow',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get action_message {
    return Intl.message(
      'Message',
      name: 'action_message',
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
