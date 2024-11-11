# secret_manager

[![secret_manager][ci_badge]][ci_link]
[![coverage][coverage_badge]][ci_link]
[![pub package][pub_badge]][pub_link]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

A secret manager that pulls values from GCP Secret Manager.

## Usage

```dart
  final secretManager = await SecretManager.defaultCredentials();
  final secret = await secretManager.getSecret('my-secret');
  // use secret...
```

[ci_badge]: https://github.com/Morel-Tech/secret_manager_dart/actions/workflows/gcp_secret_manager_verify_and_test.yaml/badge.svg?branch=main&event=push
[ci_link]: https://github.com/Morel-Tech/secret_manager_dart/actions/workflows/gcp_secret_manager_verify_and_test.yaml
[coverage_badge]: https://img.shields.io/badge/coverage-100%25-green
[pub_badge]: https://img.shields.io/pub/v/gcp_secret_manager.svg
[pub_link]: https://pub.dartlang.org/packages/gcp_secret_manager
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
