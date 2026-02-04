// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransferServerController)
final transferServerControllerProvider = TransferServerControllerProvider._();

final class TransferServerControllerProvider
    extends $StreamNotifierProvider<TransferServerController, double> {
  TransferServerControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transferServerControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transferServerControllerHash();

  @$internal
  @override
  TransferServerController create() => TransferServerController();
}

String _$transferServerControllerHash() =>
    r'6e89a6cae4bcfc07b7448c156e194b549f200d8a';

abstract class _$TransferServerController extends $StreamNotifier<double> {
  Stream<double> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<double>, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<double>, double>,
              AsyncValue<double>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(airdropInitialization)
final airdropInitializationProvider = AirdropInitializationProvider._();

final class AirdropInitializationProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  AirdropInitializationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'airdropInitializationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$airdropInitializationHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return airdropInitialization(ref);
  }
}

String _$airdropInitializationHash() =>
    r'fb468ccc5b42858436e51df615681aa8651c5e7a';

@ProviderFor(TransferClientController)
final transferClientControllerProvider = TransferClientControllerProvider._();

final class TransferClientControllerProvider
    extends $AsyncNotifierProvider<TransferClientController, void> {
  TransferClientControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transferClientControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transferClientControllerHash();

  @$internal
  @override
  TransferClientController create() => TransferClientController();
}

String _$transferClientControllerHash() =>
    r'2769330457645185df14a1d1e379d176963c30de';

abstract class _$TransferClientController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
