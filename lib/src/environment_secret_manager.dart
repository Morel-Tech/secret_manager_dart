
import 'dart:io';


import 'package:recase/recase.dart';
import 'package:secret_manager/secret_manager.dart';

/// {@template environment_secret_manager}
/// A [SecretManager] that can be used to read secrets from the environment.
/// {@endtemplate}
class EnvironmentSecretManager implements SecretManager {
  /// {@macro environment_secret_manager}
  const EnvironmentSecretManager({
    this.caseType = Case.original,
  });

  /// The format the secret name is saved as
   final Case caseType;

  @override
  String getSecret(String name, {String version = 'latest'}) {
    final secret = Platform.environment[name];
     if (secret == null) {
      throw StateError('Secret not found');
    }
    return secret;
  }

}

/// The case type to use when converting a [String] to the appropriate case.
enum Case {
  /// No modifications
  original,

  /// snake_case
  snake,

  /// param-case
  param,

  /// camelCase
  camel,

  /// PascalCase
  pascal,

  /// dot.case
  dot;

  /// Converts a [String] to the appropriate case.
  String convert(String value) {
    return switch (this) {
      Case.original => value,
      Case.snake => value.snakeCase,
      Case.param => value.paramCase,
      Case.camel => value.camelCase,
      Case.pascal => value.pascalCase,
      Case.dot => value.dotCase,
    };
  }
}
