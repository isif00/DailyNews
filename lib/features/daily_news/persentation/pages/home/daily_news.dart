import 'package:daily_news/features/daily_news/domain/entities/article.dart';
import 'package:daily_news/features/daily_news/persentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:daily_news/features/daily_news/persentation/bloc/article/remote/remote_article_state.dart';
import 'package:daily_news/features/daily_news/persentation/widgets/article_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.bookmark,
            color: Colors.black,
          ),
          onPressed: () => _onShowSavedArticlesViewTapped(context),
        )
      ],
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (_, state) {
      if (state is RemoteArticleLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is RemoteArticleError) {
        return const Center(
          child: Icon(
            Icons.refresh,
            color: Colors.red,
            size: 30,
          ),
        );
      }
      if (state is RemoteArticleDone) {
        return ListView.builder(
          itemCount: state.articles!.length,
          itemBuilder: (context, index) {
            return ArticleWidget(
              article: state.articles![index],
              onArticlePressed: (article) =>
                  _onArticlePressed(context, article),
            );
          },
        );
      }
      return const SizedBox();
    });
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }
}
