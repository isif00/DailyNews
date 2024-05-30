import 'package:daily_news/features/daily_news/domain/entities/article.dart';
import 'package:equatable/equatable.dart';

abstract class LocalArticleEvent extends Equatable{
  final ArticleEntity ? article;

  const LocalArticleEvent({this.article});

  @override
  List<Object> get props => [article!];

}

class SaveArticle extends LocalArticleEvent{
  const SaveArticle(ArticleEntity article) : super(article: article);
}

class GetSavedArticles extends LocalArticleEvent{
  const GetSavedArticles();
}

class DeleteArticle extends LocalArticleEvent{
  const DeleteArticle(ArticleEntity article) : super(article: article);
}
