// ignore_for_file: unused_local_variable

import 'package:secret_manager/secret_manager.dart';

void main() async {
  final secretManager = await GCPSecretManager.defaultCredentials();
  final secret = await secretManager.getSecret('my-secret');
  // use secret...
}
