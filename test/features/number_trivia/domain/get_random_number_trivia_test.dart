import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp/core/usecases/usecase.dart';
import 'package:flutterapp/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutterapp/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutterapp/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {}

void main() {

  GetRandomNumberTrivia usecase;
  MockNumberTriviaRepository repository;

  setUp(() {
    repository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(repository);
  });

  final tNumberTrivia = NumberTrivia(number: 1, text: "This is one");

  test('should get random trivia from repository', () async {

    when(repository.getRandomNumberTrivia())
        .thenAnswer((_) async => Right(tNumberTrivia));

    final result = await usecase(NoParams());

    expect(result, Right(tNumberTrivia));
    verify(repository.getRandomNumberTrivia());
    verifyNoMoreInteractions(repository);

  });

}