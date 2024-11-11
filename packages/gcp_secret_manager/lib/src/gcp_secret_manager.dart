import 'dart:convert';

import 'package:current_gcp_project/current_gcp_project.dart';
import 'package:googleapis/secretmanager/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart';
import 'package:secret_manager/secret_manager.dart';

/// {@template secret_manager}
/// A [SecretManager] that uses Google Cloud Secret Manager.
/// {@endtemplate}
class GCPSecretManager implements SecretManager {
  /// {@macro secret_manager}
  const GCPSecretManager(this._secretManagerApi, this._projectId);

  /// Creates a new [SecretManager] with
  /// [clientViaApplicationDefaultCredentials]
  static Future<GCPSecretManager> defaultCredentials({
    CurrentGcpProject currentGcpProject = const CurrentGcpProject(),
    Future<AutoRefreshingAuthClient> Function({
      required List<String> scopes,
      Client? baseClient,
    }) clientGetter = clientViaApplicationDefaultCredentials,
  }) async {
    final client = await clientGetter(
      scopes: [
        SecretManagerApi.cloudPlatformScope,
      ],
    );
    final api = SecretManagerApi(client);
    final currentProjectId = await currentGcpProject.currentProjectId();
    return GCPSecretManager(api, currentProjectId!);
  }

  final SecretManagerApi _secretManagerApi;
  final String _projectId;

  @override
  Future<String> getSecret(String name, {String version = 'latest'}) async {
    final secretsResponse =
        await _secretManagerApi.projects.secrets.versions.access(
      'projects/$_projectId/secrets/$name/versions/$version',
    );

    final rawPayload = secretsResponse.payload?.dataAsBytes;

    if (rawPayload == null) {
      throw StateError('Secret not found');
    }

    return utf8.decode(rawPayload);
  }
}
