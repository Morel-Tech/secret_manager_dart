import 'package:platform/platform.dart';
import 'package:secret_manager/secret_manager.dart';

/// {@template environment_secret_manager}
/// A [SecretManager] that can be used to read secrets from the environment.
/// {@endtemplate}
class EnvironmentSecretManager implements SecretManager {
  /// {@macro environment_secret_manager}
  const EnvironmentSecretManager({
    String Function(String name)? nameTransform,
    Platform? platform,
  })  : _platform = platform ?? const LocalPlatform(),
        _nameTransform = nameTransform;

  final String Function(String name)? _nameTransform;

  final Platform _platform;

  @override
  String getSecret(String name, {String version = 'latest'}) {
    final secret = _nameTransform != null
        ? _platform.environment[_nameTransform!(name)]
        : _platform.environment[name];
    if (secret == null) {
      throw StateError('Secret not found');
    }
    return secret;
  }
}
