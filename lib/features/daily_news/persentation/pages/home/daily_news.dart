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
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
          'Daily News',
          style: TextStyle(
            color: Colors.black
          ),
      ),
    );
  }

  _buildBody() {
    print('build body');
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState> (
      builder: (_,state) {
        if (state is RemoteArticleLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RemoteArticleError) {
          return const Center(
            child: Icon(Icons.refresh, color: Colors.red, size: 30,),
          );
        }
        if (state is RemoteArticleDone) {
          print(state.articles!.length);
          print(state.articles![0]);
          return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (_, index) {
              return ArticleWidget(
                article: state.articles![index],
              );
            },
          );
        }
        return const SizedBox();
      }
    );
  }
}