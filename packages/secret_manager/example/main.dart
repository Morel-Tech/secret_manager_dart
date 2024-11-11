// ignore_for_file: unused_local_variable

import 'package:secret_manager/secret_manager.dart';

void main() async {
  const secretManager = EnvironmentSecretManager();
  final secret = secretManager.getSecret('my-secret');
  // use secret...
}
