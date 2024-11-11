// ignore_for_file: one_member_abstracts

import 'dart:async';

/// {@template secret_manager}
/// An interface for a secret manager.
/// {@endtemplate}
abstract class SecretManager {
  /// Retrieves the specified version of a secret by secret name.
  FutureOr<String> getSecret(String name, {String version = 'latest'});
}
