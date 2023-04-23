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

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "amountHint": MessageLookupByLibrary.simpleMessage("Amount"),
        "appLanguage": MessageLookupByLibrary.simpleMessage("English"),
        "appName": MessageLookupByLibrary.simpleMessage("Currency Converter"),
        "baseCurrency": MessageLookupByLibrary.simpleMessage("Base currency"),
        "canNotShowHistoricalDataForBase": MessageLookupByLibrary.simpleMessage(
            "Historical data can\'t be display for a currency if it is the base currency"),
        "common": MessageLookupByLibrary.simpleMessage("Common"),
        "contentError": MessageLookupByLibrary.simpleMessage("Not found."),
        "convert": MessageLookupByLibrary.simpleMessage("Convert"),
        "converter": MessageLookupByLibrary.simpleMessage("Converter"),
        "currencies": MessageLookupByLibrary.simpleMessage("Currencies"),
        "currencyConverter":
            MessageLookupByLibrary.simpleMessage("Currency Converter"),
        "errorGettingBaseCurrency": MessageLookupByLibrary.simpleMessage(
            "Something went wrong, Try changing the base currency from Settings"),
        "forbiddenAccessError":
            MessageLookupByLibrary.simpleMessage("Forbidden access."),
        "historicalData":
            MessageLookupByLibrary.simpleMessage("Historical Data"),
        "historicalDataBaseCurrency":
            MessageLookupByLibrary.simpleMessage("Base Currency"),
        "internetError": MessageLookupByLibrary.simpleMessage(
            "Please check your internet connection"),
        "invalidAmount":
            MessageLookupByLibrary.simpleMessage("Inputted amount is invalid"),
        "invalidEqualSelection": MessageLookupByLibrary.simpleMessage(
            "Please make sure chosen currencies are different"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "lastSevenDays":
            MessageLookupByLibrary.simpleMessage("Last Seven days"),
        "noBaseSelected": MessageLookupByLibrary.simpleMessage(
            "Please make sure you have to chosen the base currency"),
        "noToSelected": MessageLookupByLibrary.simpleMessage(
            "Please make sure you have to chosen the target currency"),
        "nothingSelected": MessageLookupByLibrary.simpleMessage(
            "Please make sure you have to chosen the base and target currencies"),
        "serviceError": MessageLookupByLibrary.simpleMessage("Service error."),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "somethingIsWrong":
            MessageLookupByLibrary.simpleMessage("Something is wrong."),
        "targetCurrency":
            MessageLookupByLibrary.simpleMessage("Target currency")
      };
}
