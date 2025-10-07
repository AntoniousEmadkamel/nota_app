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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Theming`
  String get theming {
    return Intl.message('Theming', name: 'theming', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `العربية`
  String get arabic {
    return Intl.message('العربية', name: 'arabic', desc: '', args: []);
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `Add New Task`
  String get addnewtask {
    return Intl.message('Add New Task', name: 'addnewtask', desc: '', args: []);
  }

  /// `Enter Your Task Title`
  String get enteryourtasktitle {
    return Intl.message(
      'Enter Your Task Title',
      name: 'enteryourtasktitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Task Details`
  String get enteryourtaskdetails {
    return Intl.message(
      'Enter Your Task Details',
      name: 'enteryourtaskdetails',
      desc: '',
      args: [],
    );
  }

  /// `Select Time`
  String get selecttime {
    return Intl.message('Select Time', name: 'selecttime', desc: '', args: []);
  }

  /// `Save Task`
  String get savetask {
    return Intl.message('Save Task', name: 'savetask', desc: '', args: []);
  }

  /// `Task Title`
  String get tasktitle {
    return Intl.message('Task Title', name: 'tasktitle', desc: '', args: []);
  }

  /// `Task Details`
  String get taskdetails {
    return Intl.message(
      'Task Details',
      name: 'taskdetails',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get savechanges {
    return Intl.message(
      'Save Changes',
      name: 'savechanges',
      desc: '',
      args: [],
    );
  }

  /// `Done !`
  String get done {
    return Intl.message('Done !', name: 'done', desc: '', args: []);
  }

  /// `Edit Task`
  String get edittask {
    return Intl.message('Edit Task', name: 'edittask', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Auth`
  String get auth {
    return Intl.message('Auth', name: 'auth', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `SignUp`
  String get signup {
    return Intl.message('SignUp', name: 'signup', desc: '', args: []);
  }

  /// `Enter your Name`
  String get name {
    return Intl.message('Enter your Name', name: 'name', desc: '', args: []);
  }

  /// `Enter Your Email`
  String get email {
    return Intl.message('Enter Your Email', name: 'email', desc: '', args: []);
  }

  /// `Enter Your Password`
  String get password {
    return Intl.message(
      'Enter Your Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Age`
  String get age {
    return Intl.message('Enter Your Age', name: 'age', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `ok`
  String get ok {
    return Intl.message('ok', name: 'ok', desc: '', args: []);
  }

  /// `Please Verify Your Email`
  String get verifyemail {
    return Intl.message(
      'Please Verify Your Email',
      name: 'verifyemail',
      desc: '',
      args: [],
    );
  }

  /// `Wrong Email or Password `
  String get wrongemailorpassword {
    return Intl.message(
      'Wrong Email or Password ',
      name: 'wrongemailorpassword',
      desc: '',
      args: [],
    );
  }

  /// `Successfully Created Account`
  String get successfullycreatedaccount {
    return Intl.message(
      'Successfully Created Account',
      name: 'successfullycreatedaccount',
      desc: '',
      args: [],
    );
  }

  /// `The Password Provided Is Too Weak`
  String get thepasswordprovidedistooweak {
    return Intl.message(
      'The Password Provided Is Too Weak',
      name: 'thepasswordprovidedistooweak',
      desc: '',
      args: [],
    );
  }

  /// `The Account Already Exists For That Email.`
  String get theaccountalreadyexistsforthatemail {
    return Intl.message(
      'The Account Already Exists For That Email.',
      name: 'theaccountalreadyexistsforthatemail',
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
