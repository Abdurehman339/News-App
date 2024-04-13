// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BreakingNewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BreakingNewsPage(),
      );
    },
    DetailArticleRoute.name: (routeData) {
      final args = routeData.argsAs<DetailArticleRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailArticlePage(
          args.article,
          key: args.key,
        ),
      );
    },
    SavedArticlesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SavedArticlesPage(),
      );
    },
  };
}

/// generated route for
/// [BreakingNewsPage]
class BreakingNewsRoute extends PageRouteInfo<void> {
  const BreakingNewsRoute({List<PageRouteInfo>? children})
      : super(
          BreakingNewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BreakingNewsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DetailArticlePage]
class DetailArticleRoute extends PageRouteInfo<DetailArticleRouteArgs> {
  DetailArticleRoute({
    required Article article,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DetailArticleRoute.name,
          args: DetailArticleRouteArgs(
            article: article,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailArticleRoute';

  static const PageInfo<DetailArticleRouteArgs> page =
      PageInfo<DetailArticleRouteArgs>(name);
}

class DetailArticleRouteArgs {
  const DetailArticleRouteArgs({
    required this.article,
    this.key,
  });

  final Article article;

  final Key? key;

  @override
  String toString() {
    return 'DetailArticleRouteArgs{article: $article, key: $key}';
  }
}

/// generated route for
/// [SavedArticlesPage]
class SavedArticlesRoute extends PageRouteInfo<void> {
  const SavedArticlesRoute({List<PageRouteInfo>? children})
      : super(
          SavedArticlesRoute.name,
          initialChildren: children,
        );

  static const String name = 'SavedArticlesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
