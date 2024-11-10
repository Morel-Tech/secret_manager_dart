import 'package:secret_manager/secret_manager.dart';
import 'package:test/test.dart';

void main() {
  group('LocalSecretManager', () {
    test('can be created', () {
      expect(const LocalSecretManager({}), isA<LocalSecretManager>());
    });

    group('.fromFile', () {
      test('can be created from File', () async {
        expect(
          await LocalSecretManager.fromFile('test/secrets.txt'),
          isA<LocalSecretManager>(),
        );
      });
      test('reads in secrets', () async {
        final secretManager =
            await LocalSecretManager.fromFile('test/secrets.txt');
        expect(
          secretManager.getSecret('testing_key'),
          'testing_value',
        );
        expect(
          secretManager.getSecret('test_with_equals'),
          'testing=test=',
        );
      });
    });

    group('getSecret', () {
      test('returns the secret if present', () async {
        const secretManager = LocalSecretManager({'key': 'value'});
        expect(secretManager.getSecret('key'), 'value');
      });
      test('throws a state error if secret not present', () async {
        const secretManager = LocalSecretManager({});
        await expectLater(
          () async => secretManager.getSecret('key'),
          throwsA(isA<StateError>()),
        );
      });
    });
  });
}
