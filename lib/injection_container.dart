import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_clean_architecture/core/http/http_client.dart';
import 'package:flutter_clean_architecture/core/http/http_client_impl.dart';
import 'package:flutter_clean_architecture/core/http/network_info.dart';
import 'package:flutter_clean_architecture/core/http/network_info_impl.dart';
import 'package:flutter_clean_architecture/core/persistence/key_value_store.dart';
import 'package:flutter_clean_architecture/core/persistence/key_value_store_impl.dart';
import 'package:flutter_clean_architecture/features/feed/data/datasources/feed_local_data_source.dart';
import 'package:flutter_clean_architecture/features/feed/data/datasources/feed_local_data_source_impl.dart';
import 'package:flutter_clean_architecture/features/feed/data/datasources/feed_remote_data_source.dart';
import 'package:flutter_clean_architecture/features/feed/data/datasources/feed_remote_data_source_impl.dart';
import 'package:flutter_clean_architecture/features/feed/data/repositories/feeds_repository_impl.dart';
import 'package:flutter_clean_architecture/features/feed/domain/repositories/feeds_repository.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/bloc/feeds_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
        () => FeedsBloc(
      repository: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<FeedsRepository>(
        () => FeedsRepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<FeedRemoteDataSource>(
        () => FeedRemoteDataSourceImpl(httpClient: sl()),
  );

  sl.registerLazySingleton<FeedLocalDataSource>(
        () => FeedLocalDataSourceImpl(keyValueStore: sl()),
  );
  sl.registerLazySingleton<KeyValueStore>(() => KeyValueStoreImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<HttpClient>(() => HttpClientImpl(client: sl()));
  sl.registerLazySingleton(() => DataConnectionChecker());

}