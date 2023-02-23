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

  /// `To Do App`
  String get toDoApp {
    return Intl.message(
      'To Do App',
      name: 'toDoApp',
      desc: '',
      args: [],
    );
  }

  /// `Input title`
  String get inputTitle {
    return Intl.message(
      'Input title',
      name: 'inputTitle',
      desc: '',
      args: [],
    );
  }

  /// `Input description (Optional)`
  String get inputDescription {
    return Intl.message(
      'Input description (Optional)',
      name: 'inputDescription',
      desc: '',
      args: [],
    );
  }

  /// `Add Due Date`
  String get addDueDate {
    return Intl.message(
      'Add Due Date',
      name: 'addDueDate',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Add Priority`
  String get add_priority {
    return Intl.message(
      'Add Priority',
      name: 'add_priority',
      desc: '',
      args: [],
    );
  }

  /// `Added Priority`
  String get added_priority {
    return Intl.message(
      'Added Priority',
      name: 'added_priority',
      desc: '',
      args: [],
    );
  }

  /// `Created {date}`
  String createdAt(Object date) {
    return Intl.message(
      'Created $date',
      name: 'createdAt',
      desc: '',
      args: [date],
    );
  }

  /// `There is yet to be a task in progress.`
  String get emptyListProgress {
    return Intl.message(
      'There is yet to be a task in progress.',
      name: 'emptyListProgress',
      desc: '',
      args: [],
    );
  }

  /// `Total of tasks: {count}`
  String totalTask(Object count) {
    return Intl.message(
      'Total of tasks: $count',
      name: 'totalTask',
      desc: '',
      args: [count],
    );
  }

  /// `Completed tasks: {count}`
  String completedTask(Object count) {
    return Intl.message(
      'Completed tasks: $count',
      name: 'completedTask',
      desc: '',
      args: [count],
    );
  }

  /// `Due date: {date}`
  String dueDate(Object date) {
    return Intl.message(
      'Due date: $date',
      name: 'dueDate',
      desc: '',
      args: [date],
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
