import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:player/src/presentation/bloc/player/player_bloc.dart';
import 'package:player/src/presentation/bloc/player_detail/player_detail_bloc.dart';
import 'core/network/api_client.dart';
import 'data/repository/player_repository_impl.dart';
import 'domain/repositories/api_repository.dart';
import 'domain/usecases/player_usecase.dart';

final injector = GetIt.I;

void setup() {
  //dio
  injector.registerLazySingleton(Dio.new);

  //network
  injector.registerLazySingleton(ApiClient.new);

  //repository
  injector.registerLazySingleton<ApiRepository>(
        () => PlayerRepositoryImpl(
      apiClient: injector(),
    ),
  );

  //useCase
  injector.registerLazySingleton(() => PlayerUseCase(injector()));

  //bloc
  injector.registerFactory(() => PlayerBloc(injector()));
  injector.registerFactory(() => PlayerDetailsBloc(injector()));
}
