import 'dart:convert';

import 'package:platform/platform.dart';
import 'package:secret_manager/secret_manager.dart';
import 'package:test/test.dart';

void main() {
  group('EnvironmentSecretManager', () {
    test('can be created', () {
      expect(const EnvironmentSecretManager(), isA<EnvironmentSecretManager>());
    });


    group('getSecret', () {
      test('returns the secret if present', () async {
        final secretManager = EnvironmentSecretManager(
          platform: FakePlatform.fromJson(jsonEncode({'key': 'value'})),
        );
        expect(secretManager.getSecret('key'), 'value');
      });
      test('throws a state error if secret not present', () async {
         final secretManager = EnvironmentSecretManager(
          platform: FakePlatform.fromJson(jsonEncode({'key': 'value'})),
        );
        await expectLater(
          () async => secretManager.getSecret('key'),
          throwsA(isA<StateError>()),
        );
      });
    });
  });
}
