import 'package:news_mob_app/domain/models/requests/breaking_news_request.dart';
import 'package:news_mob_app/domain/models/responses/breaking_news_response.dart';
import 'package:news_mob_app/utils/resources/data_state.dart';

abstract class ApiRepository {
  Future<DataState<BreakingNewsResponse>> getBreakingNewsArticles({
    required BreakingNewsRequest request,
  });
}
