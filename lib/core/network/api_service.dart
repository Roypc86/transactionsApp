import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_service.g.dart';

/// Thin wrapper around [http.Client] for talking to the Google Apps Script
/// REST API. Keeps HTTP concerns (headers, encoding, base URL) in one place
/// so repositories don't need to know about the transport layer.
class ApiService {
  ApiService({http.Client? client, String? baseUrl})
    : _client = client ?? http.Client(),
      baseUrl = baseUrl ?? _defaultBaseUrl;

  static const String _defaultBaseUrl =
      'https://script.google.com/macros/s/REPLACE_WITH_DEPLOYMENT_ID/exec';

  final http.Client _client;
  final String baseUrl;

  Future<dynamic> get(String path, {Map<String, String>? queryParams}) async {
    final uri = Uri.parse(
      '$baseUrl$path',
    ).replace(queryParameters: queryParams);
    final response = await _client.get(uri);
    return _decode(response);
  }

  Future<dynamic> post(String path, {Map<String, dynamic>? body}) async {
    final uri = Uri.parse('$baseUrl$path');
    final response = await _client.post(
      uri,
      headers: const {'Content-Type': 'application/json'},
      body: jsonEncode(body ?? const {}),
    );
    return _decode(response);
  }

  dynamic _decode(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw HttpException(
        'Request failed with status ${response.statusCode}: ${response.body}',
      );
    }
    if (response.body.isEmpty) {
      return null;
    }
    return jsonDecode(response.body);
  }

  void dispose() => _client.close();
}

class HttpException implements Exception {
  HttpException(this.message);

  final String message;

  @override
  String toString() => 'HttpException: $message';
}

@Riverpod(keepAlive: true)
ApiService apiService(Ref ref) {
  final service = ApiService();
  ref.onDispose(service.dispose);
  return service;
}
