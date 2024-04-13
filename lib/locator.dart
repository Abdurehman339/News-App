import 'package:dio/dio.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:news_mob_app/data/datasources/local/app_database.dart';
import 'package:news_mob_app/data/datasources/remote/news_api_service.dart';
import 'package:news_mob_app/data/repositories/api_repo_impl.dart';
import 'package:news_mob_app/data/repositories/database_rep_impl.dart';
import 'package:news_mob_app/domain/repositories/api_repository.dart';
import 'package:news_mob_app/domain/repositories/database_repository.dart';
import 'package:news_mob_app/utils/constants/strings.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  locator.registerSingleton<AppDatabase>(db);

  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<NewsApiService>(
    NewsApiService(locator<Dio>()),
  );

  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(locator<NewsApiService>()),
  );

  locator.registerSingleton<DatabaseRepository>(
    DatabaseRepositoryimpl(locator<AppDatabase>()),
  );
}
