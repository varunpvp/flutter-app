import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutterapp/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutterapp/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {}

void main() {

  GetConcreteNumberTrivia usecase;
  MockNumberTriviaRepository repository;

  setUp(() {
    repository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(repository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: tNumber, text: "This is one");

  test('should get trivia for number from repository', () async {

    when(repository.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => Right(tNumberTrivia));

    final result = await usecase(Params(number: tNumber));

    expect(result, Right(tNumberTrivia));
    verify(repository.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(repository);

  });

}