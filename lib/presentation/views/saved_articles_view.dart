import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:news_mob_app/config/router/app_router.dart';
import 'package:news_mob_app/domain/models/responses/article.dart';
import 'package:news_mob_app/presentation/cubits/local_articles/local_articles_cubit.dart';
import 'package:news_mob_app/presentation/cubits/local_articles/local_articles_state.dart';
import 'package:news_mob_app/presentation/widgets/article_widget.dart';

@RoutePage()
class SavedArticlesPage extends HookWidget {
  const SavedArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.router.maybePop(),
          child: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Saved Articles',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: BlocBuilder<LocalArticlesCubit, LocalArticlesState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case const (LocalArticlesLoading):
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            case const (LocalArticlesSuccess):
              return _buildArticlesList(state.articles);
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildArticlesList(List<Article> articles) {
    if (articles.isEmpty) {
      return const Center(
        child: Text(
          'No Saved Articles',
          style: TextStyle(color: Colors.black),
        ),
      );
    }

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key('${articles[index]}'),
          onDismissed: (left) {
            BlocProvider.of<LocalArticlesCubit>(context)
                .removeArticle(article: articles[index]);
          },
          background: Container(
            color: Colors.red,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Icon(
                    Icons.delete,
                    size: 40,
                    color: Color(0xffffffff),
                  ),
                ),
              ],
            ),
          ),
          child: ArticleWidget(
            article: articles[index],
            isRemoveable: true,
            onRemove: (article) {
              BlocProvider.of<LocalArticlesCubit>(context)
                  .removeArticle(article: article);
            },
            onPressed: (article) {
              context.router.push(DetailArticleRoute(article: article));
            },
          ),
        );
      },
    );
  }
}
