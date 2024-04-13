import 'package:equatable/equatable.dart';
import 'package:news_mob_app/domain/models/responses/article.dart';

abstract class LocalArticlesState extends Equatable {
  final List<Article> articles;

  const LocalArticlesState({
    this.articles = const [],
  });

  @override
  List<Object> get props => [articles];
}

class LocalArticlesLoading extends LocalArticlesState {
  const LocalArticlesLoading();
}

class LocalArticlesSuccess extends LocalArticlesState {
  const LocalArticlesSuccess({super.articles});
}
