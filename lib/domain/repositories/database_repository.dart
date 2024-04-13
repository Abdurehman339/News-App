import 'package:news_mob_app/domain/models/responses/article.dart';

abstract class DatabaseRepository {
  Future<List<Article>> getSavedArticles();
  Future<void> saveArticle(Article article);
  Future<void> removeArticle(Article article);
}
