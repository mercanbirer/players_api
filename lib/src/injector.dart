import 'package:get_it/get_it.dart';
import 'package:player/src/data/repository/player_repository_impl.dart';
import 'package:player/src/domain/repositories/api_repository.dart';
import 'package:player/src/domain/usecases/player_usecase.dart';
import 'package:player/src/presentation/bloc/player/player_bloc.dart';
import 'package:player/src/presentation/bloc/player_detail/player_detail_bloc.dart';

import 'core/network/api_client.dart';

final injector = GetIt.I;

void setup() {
  //network
  injector.registerLazySingleton(() => ApiClient());

  //bloc
  injector.registerFactory(() => PlayerBloc(injector()));
  injector.registerFactory(() => PlayerDetailBloc(injector()));

  //useCase
  injector.registerLazySingleton(() => PlayerUseCase(injector()));

  //repository
  injector.registerLazySingleton<ApiRepository>(
        () => PlayerRepositoryImpl(
      remoteDataSource: injector(),
    ),
  );
}
