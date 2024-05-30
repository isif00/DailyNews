

import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable{
  final String ? id;
  final String ? author;
  final String ? title;
  final String ? content;
  final String ? description;
  final String ? url;
  final String ? urlToImage;
  final String ? publishedAt;

  const ArticleEntity({
    this.id,
    this.author,
    this.title,
    this.content,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
  });
  
  @override
  List<Object?> get props {
    return [
      id,
      author,
      title,
      content,
      description,
      url,
      urlToImage,
      publishedAt,
    ];
  }

}