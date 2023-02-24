// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(date) => "Completed ${date}";

  static String m1(count) => "Completed tasks: ${count}";

  static String m2(date) => "Created ${date}";

  static String m3(date) => "Due date: ${date}";

  static String m4(count) => "Total of tasks: ${count}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addDueDate": MessageLookupByLibrary.simpleMessage("Add Due Date"),
        "add_priority": MessageLookupByLibrary.simpleMessage("Add Priority"),
        "added_priority":
            MessageLookupByLibrary.simpleMessage("Added Priority"),
        "completed": MessageLookupByLibrary.simpleMessage("Completed"),
        "completedAt": m0,
        "completedTask": m1,
        "createdAt": m2,
        "done": MessageLookupByLibrary.simpleMessage("Done"),
        "dueDate": m3,
        "emptyListProgress": MessageLookupByLibrary.simpleMessage(
            "There is yet to be a task in progress."),
        "hideCompleted": MessageLookupByLibrary.simpleMessage("Hide completed"),
        "inputDescription": MessageLookupByLibrary.simpleMessage(
            "Input description (Optional)"),
        "inputTitle": MessageLookupByLibrary.simpleMessage("Input title"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "priority": MessageLookupByLibrary.simpleMessage("Priority"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "sortBy": MessageLookupByLibrary.simpleMessage("Sort by:"),
        "sureDeleteTask": MessageLookupByLibrary.simpleMessage(
            "Are you sure to delete this task?"),
        "toDoApp": MessageLookupByLibrary.simpleMessage("To Do App"),
        "totalTask": m4,
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
