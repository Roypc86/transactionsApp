import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_provider.g.dart';

/// Placeholder provider used to verify that dependency injection via
/// Riverpod is wired correctly end-to-end.
@riverpod
String dashboardGreeting(Ref ref) {
  return 'Bienvenido a tu panel financiero';
}
