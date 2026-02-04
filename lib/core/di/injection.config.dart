// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/discovery/data/discovery_repository.dart' as _i846;
import '../../features/transfer/data/transfer_client.dart' as _i547;
import '../../features/transfer/data/transfer_server.dart' as _i57;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i547.TransferClient>(() => _i547.TransferClient());
    gh.lazySingleton<_i57.TransferServer>(() => _i57.TransferServer());
    gh.lazySingleton<_i846.DiscoveryRepository>(
      () => _i846.DiscoveryRepositoryImpl(),
    );
    return this;
  }
}
