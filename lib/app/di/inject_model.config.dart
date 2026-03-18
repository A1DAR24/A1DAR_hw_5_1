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

import '../../cubit/rick_cubit.dart' as _i1021;
import '../../data/data_sours/rick_api_service.dart' as _i257;
import '../../data/repositores/rick_repository_impl.dart' as _i688;
import '../../domain/repositores/rick_repository.dart' as _i402;
import '../../domain/usecase/get_character_detail_usecase.dart' as _i421;
import '../../domain/usecase/get_characters_usecase.dart' as _i192;
import '../../repository.dart' as _i985;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i257.RickApiService>(() => _i257.RickApiService());
    gh.factory<_i985.Repository>(() => _i985.Repository());
    gh.lazySingleton<_i402.RickRepository>(
      () => _i688.RickRepositoryImpl(apiService: gh<_i257.RickApiService>()),
    );
    gh.lazySingleton<_i421.GetCharacterDetailUsecase>(
      () => _i421.GetCharacterDetailUsecase(
        repository: gh<_i402.RickRepository>(),
      ),
    );
    gh.lazySingleton<_i192.GetCharactersUsecase>(
      () => _i192.GetCharactersUsecase(repository: gh<_i402.RickRepository>()),
    );
    gh.factory<_i1021.RickCubit>(
      () => _i1021.RickCubit(
        getCharactersUsecase: gh<_i192.GetCharactersUsecase>(),
        getCharacterDetailUsecase: gh<_i421.GetCharacterDetailUsecase>(),
      ),
    );
    return this;
  }
}
