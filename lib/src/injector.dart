import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:player/src/data/repository/player_repository_impl.dart';
import 'package:player/src/domain/repositories/api_repository.dart';
import 'package:player/src/domain/usecases/player_usecase.dart';
import 'package:player/src/presentation/bloc/player/player_bloc.dart';
import 'core/network/api_client.dart';

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
}
