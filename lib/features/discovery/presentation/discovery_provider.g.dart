// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DiscoveryController)
final discoveryControllerProvider = DiscoveryControllerProvider._();

final class DiscoveryControllerProvider
    extends $StreamNotifierProvider<DiscoveryController, List<NearbyDevice>> {
  DiscoveryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'discoveryControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$discoveryControllerHash();

  @$internal
  @override
  DiscoveryController create() => DiscoveryController();
}

String _$discoveryControllerHash() =>
    r'b102e11ddd668d6f4e5f2009c381e724d82cf00f';

abstract class _$DiscoveryController
    extends $StreamNotifier<List<NearbyDevice>> {
  Stream<List<NearbyDevice>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<NearbyDevice>>, List<NearbyDevice>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<NearbyDevice>>, List<NearbyDevice>>,
              AsyncValue<List<NearbyDevice>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
