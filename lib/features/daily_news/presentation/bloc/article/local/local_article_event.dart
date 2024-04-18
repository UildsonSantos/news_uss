import 'package:equatable/equatable.dart';

import 'package:news_uss/features/daily_news/domain/entities/article.dart';

abstract class LocalArticlesEvent extends Equatable {
  final ArticleEntity? articleEntity;

  const LocalArticlesEvent({this.articleEntity});

  @override
  List<Object> get props => [];
}

class GetSavedArticles extends LocalArticlesEvent {
  const GetSavedArticles();
}

class RemoveArticle extends LocalArticlesEvent {
  const RemoveArticle(ArticleEntity articleEntity)
      : super(articleEntity: articleEntity);
}

class SaveArticle extends LocalArticlesEvent {
  const SaveArticle(ArticleEntity articleEntity)
      : super(articleEntity: articleEntity);
}
