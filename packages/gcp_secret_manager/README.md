# secret_manager

[![secret_manager](https://github.com/Morel-Tech/secret_manager_dart/actions/workflows/gcp_secret_manager_verify_and_test.yaml/badge.svg?branch=main&event=push)](https://github.com/Morel-Tech/secret_manager_dart/actions/workflows/gcp_secret_manager_verify_and_test.yaml)[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

A secret manager that pulls values from GCP Secret Manager.

## Usage

```dart
  final secretManager = await SecretManager.defaultCredentials();
  final secret = await secretManager.getSecret('my-secret');
  // use secret...
```

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
