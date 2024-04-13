// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:news_mob_app/data/base/base_api_repository.dart';
import 'package:news_mob_app/data/datasources/remote/news_api_service.dart';
import 'package:news_mob_app/domain/models/requests/breaking_news_request.dart';
import 'package:news_mob_app/domain/models/responses/breaking_news_response.dart';
import 'package:news_mob_app/domain/repositories/api_repository.dart';
import 'package:news_mob_app/utils/resources/data_state.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final NewsApiService _newsApiService;

  ApiRepositoryImpl(
    this._newsApiService,
  );

  @override
  Future<DataState<BreakingNewsResponse>> getBreakingNewsArticles({
    required BreakingNewsRequest request,
  }) {
    return getStateOf<BreakingNewsResponse>(
      request: () => _newsApiService.getBreakingNewsArticles(
        apiKey: request.apiKey,
        country: request.country,
        category: request.category,
        page: request.page,
        pageSize: request.pageSize,
      ),
    );
  }
}
