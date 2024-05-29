import 'package:daily_news/core/resources/data_state.dart';
import 'package:daily_news/features/daily_news/data/models/article.dart';
import 'package:daily_news/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getArticles() {
    // TODO: implement getArticles
    throw UnimplementedError();
  }
}
