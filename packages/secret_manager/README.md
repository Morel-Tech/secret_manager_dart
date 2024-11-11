# Secret Manager

[![secret_manager](https://github.com/Morel-Tech/secret_manager/actions/workflows/secret_manager.yaml/badge.svg?branch=main&event=push)](https://github.com/Morel-Tech/secret_manager/actions/workflows/secret_manager.yaml)
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Access your secrets no matter where they're stored. Built in support for reading secrets from:

- Environment variables
- A local File
- Google Cloud Secret Manager

## Environment Variables

```dart
  final secretManager = await EnvironmentSecretManager();
  final secret = secretManager.getSecret('my-secret');
  // use secret...
```

## Local File

Just make sure you don't check your secrets file into version control!

```dart
  final secretManager = await LocalSecretManager.fromFile();
  final secret = secretManager.getSecret('my-secret');
  // use secret...
```

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
