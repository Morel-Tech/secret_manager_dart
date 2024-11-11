import 'package:mocktail/mocktail.dart';
import 'package:platform/platform.dart';
import 'package:secret_manager/secret_manager.dart';
import 'package:test/test.dart';

class _MockPlatform extends Mock implements Platform {}

void main() {
  group('EnvironmentSecretManager', () {
    late Platform platform;

    setUp(() {
      platform = _MockPlatform();
    });

    test('can be created', () {
      expect(const EnvironmentSecretManager(), isA<EnvironmentSecretManager>());
    });

    group('getSecret', () {
      test('returns the secret if present', () async {
        when(() => platform.environment).thenReturn({'key': 'value'});
        final secretManager = EnvironmentSecretManager(platform: platform);
        expect(secretManager.getSecret('key'), 'value');
      });
      test('throws a state error if secret not present', () async {
        when(() => platform.environment).thenReturn({});
        final secretManager = EnvironmentSecretManager(platform: platform);
        await expectLater(
          () async => secretManager.getSecret('key'),
          throwsA(isA<StateError>()),
        );
      });
    });
  });

  group('Case', () {
    group('convert', () {
      test('original', () {
        expect(Case.original.convert('test value'), equals('test value'));
      });
      test('snake', () {
        expect(Case.snake.convert('test value'), equals('test_value'));
      });
      test('pascal', () {
        expect(Case.pascal.convert('test value'), equals('TestValue'));
      });
      test('camel', () {
        expect(Case.camel.convert('test value'), equals('testValue'));
      });
      test('param', () {
        expect(Case.param.convert('test value'), equals('test-value'));
      });
      test('dot', () {
        expect(Case.dot.convert('test value'), equals('test.value'));
      });
    });
  });
}
