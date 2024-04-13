import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_mob_app/config/router/app_router.dart';
import 'package:news_mob_app/config/themes/app_themes.dart';
import 'package:news_mob_app/domain/repositories/api_repository.dart';
import 'package:news_mob_app/domain/repositories/database_repository.dart';
import 'package:news_mob_app/locator.dart';
import 'package:news_mob_app/presentation/cubits/local_articles/local_articles_cubit.dart';
import 'package:news_mob_app/presentation/cubits/remote_articles/remote_articles_cubit.dart';
import 'package:news_mob_app/utils/constants/strings.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  runApp(MyApp());
}

// assuming this is the root widget of your App
class MyApp extends StatelessWidget {
  // make sure you don't initiate your router
  // inside of the build function.
  final _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return LocalArticlesCubit(
            locator<DatabaseRepository>(),
          )..getAllSavedArticles();
        }),
        BlocProvider(create: (context) {
          return RemoteArticlesCubit(
            locator<ApiRepository>(),
          )..getBreakingNewsArticles();
        }),
      ],
      child: OKToast(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(),
          title: title,
          theme: AppTheme.light,
        ),
      ),
    );
  }
}
