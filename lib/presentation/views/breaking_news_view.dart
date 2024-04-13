import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:news_mob_app/config/router/app_router.dart';
import 'package:news_mob_app/domain/models/responses/article.dart';
import 'package:news_mob_app/presentation/cubits/remote_articles/remote_articles_cubit.dart';
import 'package:news_mob_app/presentation/cubits/remote_articles/remote_articles_state.dart';
import 'package:news_mob_app/presentation/widgets/article_widget.dart';
import 'package:news_mob_app/utils/extensions/scroll_controller.dart';

@RoutePage()
class BreakingNewsPage extends HookWidget {
  const BreakingNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final remoteArticlesCubit = BlocProvider.of<RemoteArticlesCubit>(context);
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.onScrollEndsListner(() {
        remoteArticlesCubit.getBreakingNewsArticles();
      });
      return scrollController.dispose;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily News',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 25,
            ),
            child: IconButton(
              onPressed: () {
                context.router.push(const SavedArticlesRoute());
              },
              icon: const Icon(Icons.bookmark_outline),
            ),
          ),
        ],
      ),
      body: BlocBuilder<RemoteArticlesCubit, RemoteArticlesState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case const (RemoteArticlesLoading):
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            case const (RemoteArticleFailed):
              return const Center(
                child: Icon(Icons.refresh),
              );
            case const (RemoteArticlesSuccess):
              return _buildArticle(
                scrollController,
                state.articles,
                state.noMoreData,
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildArticle(
    ScrollController scrollController,
    List<Article> articles,
    bool noMoreData,
  ) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: articles.length,
            (context, index) {
              return ArticleWidget(
                article: articles[index],
                onPressed: (e) {
                  context.router.push(DetailArticleRoute(article: e));
                },
              );
            },
          ),
        ),
        if (!noMoreData)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 14, bottom: 32),
              child: CupertinoActivityIndicator(),
            ),
          ),
      ],
    );
  }
}
