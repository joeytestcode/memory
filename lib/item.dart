import 'dart:convert';

import 'package:equatable/equatable.dart';

class Item extends Equatable {
  late final String lang1;
  late final String lang2;
  int level = 4;

  Item(this.lang1, this.lang2, [this.level = 4]);

  Item fromJsonMap(Map<String, dynamic> parsedJson) {
    return Item(
      parsedJson['lang1'],
      parsedJson['lang2'],
      parsedJson['level'],
    );
  }

  String toJson() {
    return jsonEncode({
      'lang1': lang1,
      'lang2': lang2,
      'level': level,
    });
  }

  String getSearchString() {
    return [lang1, lang2].toString();
  }

  @override
  List<Object?> get props => [lang1];
}
