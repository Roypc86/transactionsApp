// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Placeholder provider used to verify that dependency injection via
/// Riverpod is wired correctly end-to-end.

@ProviderFor(dashboardGreeting)
final dashboardGreetingProvider = DashboardGreetingProvider._();

/// Placeholder provider used to verify that dependency injection via
/// Riverpod is wired correctly end-to-end.

final class DashboardGreetingProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  /// Placeholder provider used to verify that dependency injection via
  /// Riverpod is wired correctly end-to-end.
  DashboardGreetingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardGreetingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardGreetingHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return dashboardGreeting(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$dashboardGreetingHash() => r'776b18a1f4c29916b3d2133081d34864f125a693';
