import 'package:floor/floor.dart';
import 'package:news_mob_app/domain/models/responses/article.dart';
import 'package:news_mob_app/utils/constants/strings.dart';

@dao
abstract class ArticleDao {
  @Query('SELECT * FROM $articlesTableName')
  Future<List<Article>> getAllArticles();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertArticle(Article article);

  @delete
  Future<void> deleteArticle(Article article);
}
