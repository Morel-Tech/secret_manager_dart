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

    group('getSecret with nameTransform', () {
      test('returns the secret if present', () async {
        when(() => platform.environment)
            .thenReturn({'transformed_key': 'value'});
        final secretManager = EnvironmentSecretManager(
          platform: platform,
          nameTransform: (name) => 'transformed_$name',
        );
        expect(secretManager.getSecret('key'), 'value');
      });
      test('throws a state error if secret not present', () async {
        when(() => platform.environment).thenReturn({});
        final secretManager = EnvironmentSecretManager(
          platform: platform,
          nameTransform: (name) => 'transformed_$name',
        );
        await expectLater(
          () async => secretManager.getSecret('key'),
          throwsA(isA<StateError>()),
        );
      });
    });
  });
}
