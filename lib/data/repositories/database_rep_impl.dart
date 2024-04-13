import 'package:news_mob_app/data/datasources/local/app_database.dart';
import 'package:news_mob_app/domain/models/responses/article.dart';
import 'package:news_mob_app/domain/repositories/database_repository.dart';

class DatabaseRepositoryimpl implements DatabaseRepository {
  final AppDatabase _appDatabase;

  DatabaseRepositoryimpl(this._appDatabase);

  @override
  Future<List<Article>> getSavedArticles() {
    return _appDatabase.articleDao.getAllArticles();
  }

  @override
  Future<void> removeArticle(Article article) {
    return _appDatabase.articleDao.deleteArticle(article);
  }

  @override
  Future<void> saveArticle(Article article) {
    return _appDatabase.articleDao.insertArticle(article);
  }
}
