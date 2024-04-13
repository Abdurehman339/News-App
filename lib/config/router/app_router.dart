import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:news_mob_app/domain/models/responses/article.dart';
import 'package:news_mob_app/presentation/views/breaking_news_view.dart';
import 'package:news_mob_app/presentation/views/detail_article_view.dart';
import 'package:news_mob_app/presentation/views/saved_articles_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: BreakingNewsRoute.page, initial: true),
        AutoRoute(page: DetailArticleRoute.page),
        AutoRoute(page: SavedArticlesRoute.page)
      ];
}
