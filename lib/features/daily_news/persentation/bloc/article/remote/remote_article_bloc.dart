import 'package:daily_news/core/resources/data_state.dart';
import 'package:daily_news/features/daily_news/domain/usecases/get_article.dart';
import 'package:daily_news/features/daily_news/persentation/bloc/article/remote/remote_article_event.dart';
import 'package:daily_news/features/daily_news/persentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {

    final GetArticleUseCase _getArticleUseCase;


    RemoteArticleBloc(this._getArticleUseCase) : super(const RemoteArticleLoading()){
      on <GetArticle> (onGetArticle);
    }

    void onGetArticle(GetArticle event, Emitter<RemoteArticleState> emit) async {
      final dataState = await _getArticleUseCase();

      if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
        emit(
          RemoteArticleDone(dataState.data!)
        );
      }

      if (dataState is DataError) {
        emit(
          RemoteArticleError(dataState.error!)
        );
      }
    }
}