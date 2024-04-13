import 'package:news_mob_app/domain/models/requests/breaking_news_request.dart';
import 'package:news_mob_app/domain/models/responses/article.dart';
import 'package:news_mob_app/domain/repositories/api_repository.dart';
import 'package:news_mob_app/presentation/cubits/base/base_cubit.dart';
import 'package:news_mob_app/presentation/cubits/remote_articles/remote_articles_state.dart';
import 'package:news_mob_app/utils/constants/nums.dart';
import 'package:news_mob_app/utils/resources/data_state.dart';

class RemoteArticlesCubit
    extends BaseCubit<RemoteArticlesState, List<Article>> {
  final ApiRepository _apiRepository;
  RemoteArticlesCubit(this._apiRepository)
      : super(const RemoteArticlesLoading(), []);

  int _page = 1;

  Future<void> getBreakingNewsArticles() async {
    if (isBusy) return;

    await run(() async {
      final response = await _apiRepository.getBreakingNewsArticles(
        request: BreakingNewsRequest(
          page: _page,
        ),
      );
      if (response is DataSuccess) {
        final articles = response.data!.articles;
        final noMoreData = articles.length < defaultPageSize;

        data.addAll(articles);
        _page++;

        emit(RemoteArticlesSuccess(articles: data, noMoreData: noMoreData));
      } else if (response is DataFailed) {
        emit(RemoteArticleFailed(error: response.error));
      }
    });
  }
}
