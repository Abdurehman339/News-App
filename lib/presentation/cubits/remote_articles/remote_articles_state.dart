import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:news_mob_app/domain/models/responses/article.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<Article> articles;
  final bool noMoreData;
  final DioException? error;

  const RemoteArticlesState({
    this.articles = const [],
    this.noMoreData = true,
    this.error,
  });

  @override
  List<Object?> get props => [articles, noMoreData, error];
}

class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

class RemoteArticlesSuccess extends RemoteArticlesState {
  const RemoteArticlesSuccess({
    super.articles,
    super.noMoreData,
  });
}

class RemoteArticleFailed extends RemoteArticlesState {
  const RemoteArticleFailed({
    super.error,
  });
}
