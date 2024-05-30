import 'package:daily_news/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:daily_news/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:daily_news/features/daily_news/domain/repository/article_repository.dart';
import 'package:daily_news/features/daily_news/domain/usecases/get_article.dart';
import 'package:daily_news/features/daily_news/persentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {

  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(sl())
  );

  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl())
  );

  sl.registerFactory<RemoteArticleBloc>(
    () => RemoteArticleBloc(sl())
  );

  
}