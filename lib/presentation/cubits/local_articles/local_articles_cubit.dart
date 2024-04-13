import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_mob_app/domain/models/responses/article.dart';
import 'package:news_mob_app/domain/repositories/database_repository.dart';
import 'package:news_mob_app/presentation/cubits/local_articles/local_articles_state.dart';

class LocalArticlesCubit extends Cubit<LocalArticlesState> {
  final DatabaseRepository _databaseRepository;

  LocalArticlesCubit(this._databaseRepository)
      : super(const LocalArticlesLoading());

  Future<void> getAllSavedArticles() async {
    emit(await _getAllSavedArticles());
  }

  Future<void> removeArticle({required Article article}) async {
    await _databaseRepository.removeArticle(article);
    emit(await _getAllSavedArticles());
  }

  Future<void> saveArticle({required Article article}) async {
    await _databaseRepository.saveArticle(article);
    emit(await _getAllSavedArticles());
  }

  Future<LocalArticlesState> _getAllSavedArticles() async {
    final articles = await _databaseRepository.getSavedArticles();
    return LocalArticlesSuccess(articles: articles);
  }
}
