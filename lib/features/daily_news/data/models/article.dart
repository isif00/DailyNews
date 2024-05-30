import 'package:daily_news/core/constants/constants.dart';
import 'package:daily_news/features/daily_news/domain/entities/article.dart';


class ArticleModel extends ArticleEntity {
  const ArticleModel({
    required String id,
    required String author,
    required String title,
    required String content,
    required String description,
    required String url,
    required String urlToImage,
    required String publishedAt,
  }) : super(
          id: id,
          author: author,
          title: title,
          content: content,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['source']['id'] ?? '',
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? kDefaultImage,
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'] ?? '',
    );
  }
}