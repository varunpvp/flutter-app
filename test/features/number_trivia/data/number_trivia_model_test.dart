import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutterapp/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {

  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: "This is one");

  test('should be a subclass of NumberTrivia entity', () {
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group('fromJson', () {

    test('should return a valid model when the JSON number is an integer', () async {

      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));

      final result = NumberTriviaModel.fromJson(jsonMap);

      expect(result, tNumberTriviaModel);

    });

    test('should return a valid model when the JSON number is a double', () async {

      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia_double.json'));

      final result = NumberTriviaModel.fromJson(jsonMap);

      expect(result, tNumberTriviaModel);

    });

  });

  group('toJson', () {

    test('should return a json', () {

      final result = tNumberTriviaModel.toJson();

      final expectedMap = {
        "text": "This is one",
        "number": 1
      };

      expect(result, expectedMap);

    });

  });

}